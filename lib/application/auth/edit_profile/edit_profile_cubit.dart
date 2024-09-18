import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../domain/core/core_repository.dart';
import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/core/dtos/highlight/highlight_dto.dart';
import '../../../infrastructure/core/i_core_repository.dart';
import '../../../infrastructure/user/i_user_repository.dart';
import '../../../presentation/user/profile_settings/widgets/highlights_tab.dart';

part 'edit_profile_cubit.freezed.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(super.initialState);

  void init() {
    emit(state.copyWith(isLoading: true));
    fetchUserDetails(id: state.userId);
  }

  void initilizeHighlighttTab() {
    if (state.user?.highlight?.isNotEmpty ?? false) {
      List<Widget> highLightItem = [];
      state.user?.highlight?.forEach((item) {
        highLightItem.add(
          ImageHighlight(
            item: item,
            userId: state.userId,
          ),
        );
      });

      emit(state.copyWith(highlightWidgets: highLightItem));
    }
  }

  void addOneMoreHighlight() {
    // Ensure highlightWidgets is not empty and the last widget is an ImageHighlight
    if (state.highlightWidgets.isNotEmpty &&
        state.highlightWidgets.last is ImageHighlight) {
      // Create a new list by copying the existing highlightWidgets list
      List<Widget> highLightItem = List.from(state.highlightWidgets);

      // Add the new widget (KImagePicker) to the copied list
      highLightItem.add(KImagePicker());

      // Emit the new state with the updated highlightWidgets
      emit(state.copyWith(highlightWidgets: highLightItem));
      state.caraouselController.animateToPage(highLightItem.length,
          duration: const Duration(milliseconds: 500));
    }
  }

  void fetchUserDetails({required int id}) async {
    final response = await state.userRepository.fetchUserDetails(userId: id);
    response.fold((l) {
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    }, (r) {
      state.nameEditingController.text = r.fullName;
      state.bioTextController.text = r.description;
      r = r.copyWith(highlight: [
        HighlightDto(
            id: '1',
            url:
                'https://gratisography.com/wp-content/uploads/2024/03/gratisography-funflower-1170x780.jpg'),
        HighlightDto(
            id: '2',
            url:
                'https://gratisography.com/wp-content/uploads/2024/01/gratisography-cyber-kitty-1170x780.jpg')
      ]);

      emit(
        state.copyWith(
          isLoading: false,
          user: r,
          coverImageUrl: r.coverImage,
          profileImageUrl: r.profileImage,
        ),
      );
      initilizeHighlighttTab();
    });
  }

  void onSelectHighLightImage() async {
    emit(state.copyWith(isLoading: true));
    final response = await state.coreRepository.selectImage();
    response.fold((l) {
      if (l == PermissionStatus.permanentlyDenied) {
        // showpopup
      }
    }, (r) async {
      if (r == null) {
        emit(
          state.copyWith(
            isLoading: false,
          ),
        );
        return;
      }
      emit(state.copyWith(
        isLoading: true,
      ));
      final res = await state.coreRepository.uploadFile(file: r);
      var newHighLight = HighlightDto(id: '-1', url: res);

// Update the user's highlight list by creating a new copy of the user
      List<HighlightDto> updatedHighlights = [
        ...state.user?.highlight ?? [],
        newHighLight,
      ];

// Create a new user instance with the updated highlight list
      var updatedUser = state.user?.copyWith(highlight: updatedHighlights);

      emit(
        state.copyWith(
            isLoading: false,
            isSuccess: true,
            isFailure: false,
            isSaveEnabled: true,
            user: updatedUser),
      );
      initilizeHighlighttTab();
    });
  }

  void deleteHighLight(HighlightDto item) {
    print(item);
    try {
      // Check if the user and highlight list are not null
      if (state.user != null && state.user!.highlight != null) {
        // Create a new list by removing the specified highlight item
        List<HighlightDto> updatedHighlights = state.user!.highlight!
            .where((highlight) =>
                highlight.id != item.id && highlight.url != item.url)
            .toList();

        // Create a new UserDto with the updated highlights list
        var updatedUser = state.user!.copyWith(highlight: updatedHighlights);

        // Emit the new state with the updated user
        emit(state.copyWith(user: updatedUser));
        initilizeHighlighttTab();
      }
    } catch (e) {
      print(e);
    }
  }

  void updatedHighlight(HighlightDto item) async {
    emit(state.copyWith(isLoading: true));
    final response = await state.coreRepository.selectImage();
    response.fold((l) {
      // Handle if the permission is permanently denied
      if (l == PermissionStatus.permanentlyDenied) {
        // showpopup or handle accordingly
      }
    }, (r) async {
      // If no image is selected, stop loading and return early
      if (r == null) {
        emit(state.copyWith(isLoading: false));
        return;
      }


      final newImageUrl = await state.coreRepository.uploadFile(file: r);


      HighlightDto updatedItem = item.copyWith(url: newImageUrl);
      if (state.user != null && state.user!.highlight != null) {


        List<HighlightDto> updatedHighlights =
            state.user!.highlight!.map((highlight) {
          return highlight.id == item.id && highlight.url == item.url
              ? updatedItem
              : highlight;
        }).toList();
        print(updatedHighlights);
        var updatedUser = state.user!.copyWith(highlight: updatedHighlights);
        emit(state.copyWith(
          user: updatedUser,
          isLoading: false,
        ));
        initilizeHighlighttTab();
      } else {
        emit(state.copyWith(isLoading: false));
      }
    });
  }

  void onSelectCoverImage() async {
    emit(state.copyWith(isLoading: true));
    final response = await state.coreRepository.selectImage();
    response.fold((l) {
      if (l == PermissionStatus.permanentlyDenied) {
        // showpopup
      }
    }, (r) async {
      if (r == null) {
        emit(
          state.copyWith(
            isLoading: false,
          ),
        );
        return;
      }
      emit(state.copyWith(
        isLoading: true,
      ));
      final res = await state.coreRepository.uploadFile(file: r);
      emit(
        state.copyWith(
          isLoading: false,
          isSuccess: true,
          isFailure: false,
          coverImageUrl: res,
          isSaveEnabled: true,
        ),
      );
    });
  }

  void onCameraImageChange() async {
    emit(state.copyWith(isLoading: true));
    final response = await state.coreRepository.openCamera();
    print(response);
    response.fold((l) {
      if (l == PermissionStatus.permanentlyDenied) {
        // showpopup
      }
    }, (r) async {
      if (r == null) {
        emit(state.copyWith(isLoading: false));
        return;
      }
      emit(state.copyWith(
        isLoading: true,
      ));
      final res = await state.coreRepository.uploadFile(file: r);
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        profileImageUrl: res,
        isSaveEnabled: true,
      ));
    });
  }

  void onProfileImageChange() async {
    emit(state.copyWith(isLoading: true));
    final response = await state.coreRepository.selectImage();

    response.fold((l) {
      if (l == PermissionStatus.permanentlyDenied) {
        // showpopup
      }
    }, (r) async {
      if (r == null) {
        emit(state.copyWith(isLoading: false));
        return;
      }
      emit(state.copyWith(
        isLoading: true,
      ));
      final res = await state.coreRepository.uploadFile(file: r);
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        profileImageUrl: res,
        isSaveEnabled: true,
      ));
    });
  }

  void onNameChange() {
    if (!state.isSaveEnabled) {
      emit(state.copyWith(isSaveEnabled: true));
    }
  }

  void onBioChange() {
    if (!state.isSaveEnabled) {
      emit(state.copyWith(isSaveEnabled: true));
    }
  }

  void onSave() async {
    emit(state.copyWith(isLoading: true));
    Map<String, dynamic> patchObj = {
      'profileImage': state.profileImageUrl,
      'coverImage': state.coverImageUrl,
      'description': state.bioTextController.text,
      'fullName': state.nameEditingController.text,
      'highlight': state.user?.highlight,
    };

    final response = await state.userRepository.patchProfile(input: patchObj);

    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        user: r,
        coverImageUrl: r.coverImage,
        profileImageUrl: r.profileImage,
        isSaveEnabled: false,
      ));
    });
  }
  

  void onSelectHighLightCameraImage() async{
        emit(state.copyWith(isLoading: true));
    final response = await state.coreRepository.openCamera();
    print(response);
    response.fold((l) {
      if (l == PermissionStatus.permanentlyDenied) {
        // showpopup
      }
    }, (r) async {
      if (r == null) {
        emit(state.copyWith(isLoading: false));
        return;
      }
      emit(state.copyWith(
        isLoading: true,
      ));
      final res = await state.coreRepository.uploadFile(file: r);
      var newHighLight = HighlightDto(id: '-1', url: res);


      List<HighlightDto> updatedHighlights = [
        ...state.user?.highlight ?? [],
        newHighLight,
      ];
      var updatedUser = state.user?.copyWith(highlight: updatedHighlights);

      emit(
        state.copyWith(
            isLoading: false,
            isSuccess: true,
            isFailure: false,
            isSaveEnabled: true,
            user: updatedUser),
      );
      initilizeHighlighttTab();


    });
  }

}

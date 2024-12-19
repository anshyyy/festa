import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/auth/auth_repository.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/constants/other_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/storage_service/location_storage_service.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/auth/i_auth_repository.dart';
import '../../../infrastructure/user/dtos/settings_menu/settings_menu_dto.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(super.initialState);

  void logout() async {
    emit(state.copyWith(isLoading: true));

    final isLogoutSuccessfully = await state.authRepository.logout();
    await state.locationStorage.deleteLocation();
    emit(state.copyWith(
      isLogout: isLogoutSuccessfully,
      isFailure: !isLogoutSuccessfully,
      responseMsg: ProfileAndSettingsScreenConstants.logoutSuccess,
    ));
  }

  void emitFromAnywhere({required ProfileState state}) {
    emit(state);
  }

  void onMenuSearch({required String query}) {
    final List<SettingsMenuDto> allMenus = OtherConstants.settingsMenu;
    final List<SettingsMenuDto> filteredMenus = allMenus
        .where((menu) => menu.title.toLowerCase().contains(query))
        .toList();
    emit(state.copyWith(settingsMenu: query.isEmpty ? [] : filteredMenus));
  }

  void clearMenuSearch() {
    state.menuSearchController.clear();
    emit(state.copyWith(noUse: !state.noUse, settingsMenu: []));
  }
}

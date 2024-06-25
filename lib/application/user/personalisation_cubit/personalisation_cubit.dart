import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/user/dtos/personalization_menu/personalization_menu_dto.dart';
import '../../../infrastructure/user/dtos/personalize_option/personalize_option_dto.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'personalisation_state.dart';
part 'personalisation_cubit.freezed.dart';

class PersonalisationCubit extends Cubit<PersonalisationState> {
  PersonalisationCubit(super.initialState);

  void init() {
    fetchPersonalizeMenu();
  }

  void fetchPersonalizeMenu() async {
    emit(state.copyWith(isLoading: true));
    final list = await state.userRepository.fetchPersonalizeMenu();
    emit(state.copyWith(
      isLoading: false,
      personalizationList: list,
    ));
  }

  void updatePersonalizedMenu(
      {required String menuTitle,
      required List<PersonalizationOptionDto> updatedList}) {
    // final temp = state.personalizationList.map((e) => e).toList();
    final personalizedList = state.personalizationList.map((e) {
      if (e.title == menuTitle) {
        return e.copyWith(list: updatedList);
      }
      return e;
    }).toList();

    state.userRepository.updatePersonalizedMenu(title: menuTitle, list: updatedList.where((e) => e.isSelected).map((e) => e.type).toList());

    emit(state.copyWith(
        noUse: !state.noUse, personalizationList: personalizedList));
  }
}

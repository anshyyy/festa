import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../infrastructure/user/dtos/personalize_option/personalize_option_dto.dart';

part 'personalize_menu_state.dart';
part 'personalize_menu_cubit.freezed.dart';

class PersonalizeMenuCubit extends Cubit<PersonalizeMenuState> {
  PersonalizeMenuCubit(super.initialState);

  void onChipPressed({required String type}) {
    final updated = state.menuOptionsList.map((e) {
      return e.type == type ? e.copyWith(isSelected: !e.isSelected) : e;
    }).toList();
    emit(state.copyWith(menuOptionsList: updated));
  }
}

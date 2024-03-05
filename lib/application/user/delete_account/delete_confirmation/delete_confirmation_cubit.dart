import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/core/constants/string_constants.dart';

part 'delete_confirmation_state.dart';
part 'delete_confirmation_cubit.freezed.dart';

class DeleteConfirmationCubit extends Cubit<DeleteConfirmationState> {
  DeleteConfirmationCubit() : super(DeleteConfirmationState.initial());

  void onDeleteFieldChange({required value}){
    bool isEnabled = false;
    if(value == DeleteAccountScreenConstants.delete){
      isEnabled = true;
    }
    emit(state.copyWith(deleteEnabled: isEnabled));
  }
}

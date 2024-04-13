import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/auth/auth_repository.dart';
import '../../../../domain/core/constants/string_constants.dart';
import '../../../../infrastructure/auth/i_auth_repository.dart';

part 'delete_confirmation_state.dart';
part 'delete_confirmation_cubit.freezed.dart';

class DeleteConfirmationCubit extends Cubit<DeleteConfirmationState> {
  DeleteConfirmationCubit(super.initialState);

  void onDeleteFieldChange({required value}) {
    bool isEnabled = false;
    if (value == DeleteAccountScreenConstants.delete) {
      isEnabled = true;
    }
    emit(state.copyWith(deleteEnabled: isEnabled));
  }

  void deleteAccount() async {
    emit(state.copyWith(isLoading: true));
    final response = await state.authRepository.deleteProfile(id: state.userId, reason: state.deleteReason,);
    if(response){
      await state.authRepository.logout();
    }else{
      Fluttertoast.showToast(
                      msg: 'Something went wrong. Please try again later.');
    }
    emit(state.copyWith(
      deleteSuccess: response,
      deleteFailure: !response,
      noUse: !state.noUse,
      isLoading: true,
    ));
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'email_cubit.freezed.dart';
part 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit(super.initialState);

  void validateError({required bool hasError}) {
    emit(state.copyWith(hasValidationError: hasError));
  }

  void sendOtpToEmail() async{
    emit(state.copyWith(
      isLoading: true,
    ));
    final isOtpSend = await state.userRepository.sendOtpToEmail(email: state.emailTextController.text);
    emit(state.copyWith(
      isLoading: false,
      isOtpSent: isOtpSend,
    ));
  }
}

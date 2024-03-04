import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_state.dart';
part 'email_cubit.freezed.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit() : super(EmailState.initial());

  void validateError({required bool hasError}) {
    emit(state.copyWith(hasValidationError: hasError));
  }
}

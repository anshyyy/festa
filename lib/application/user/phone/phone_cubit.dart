import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_state.dart';
part 'phone_cubit.freezed.dart';

class PhoneCubit extends Cubit<PhoneState> {
  PhoneCubit() : super(PhoneState.initial());
}

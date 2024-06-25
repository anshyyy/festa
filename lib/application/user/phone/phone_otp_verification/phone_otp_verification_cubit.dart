import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_otp_verification_state.dart';
part 'phone_otp_verification_cubit.freezed.dart';

class PhoneOtpVerificationCubit extends Cubit<PhoneOtpVerificationState> {
  PhoneOtpVerificationCubit(super.initialState);
}

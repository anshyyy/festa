import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_details_state.dart';
part 'phone_details_cubit.freezed.dart';

class PhoneDetailsCubit extends Cubit<PhoneDetailsState> {
  PhoneDetailsCubit() : super(PhoneDetailsState.initial());
}

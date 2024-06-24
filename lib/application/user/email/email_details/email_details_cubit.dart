import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_details_state.dart';
part 'email_details_cubit.freezed.dart';

class EmailDetailsCubit extends Cubit<EmailDetailsState> {
  EmailDetailsCubit(super.initialState);
}

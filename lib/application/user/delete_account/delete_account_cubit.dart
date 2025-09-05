import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_account_state.dart';
part 'delete_account_cubit.freezed.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit() : super(DeleteAccountState.initial());

  void onReasonSelect({required int selectedIndex}){
    emit(state.copyWith(deleteReasonIndex: selectedIndex));
  }
}

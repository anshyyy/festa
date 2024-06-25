part of 'delete_account_cubit.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState({
    required int deleteReasonIndex, 
  }) = _DeleteAccountState;
   factory DeleteAccountState.initial() => const DeleteAccountState(deleteReasonIndex: -1);
}

part of 'delete_confirmation_cubit.dart';

@freezed
class DeleteConfirmationState with _$DeleteConfirmationState {
  const factory DeleteConfirmationState({
    required bool noUse,
    required bool deleteEnabled,
  }) = _DeleteConfirmationState;
   factory DeleteConfirmationState.initial() => const DeleteConfirmationState(noUse: false, deleteEnabled: false);
}

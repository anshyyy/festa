part of 'delete_confirmation_cubit.dart';

@freezed
class DeleteConfirmationState with _$DeleteConfirmationState {
  const factory DeleteConfirmationState({
    required bool noUse,
    required bool deleteEnabled,
    required bool deleteSuccess,
    required bool deleteFailure,
    required int userId,
    required AuthRepository authRepository,
  }) = _DeleteConfirmationState;
  factory DeleteConfirmationState.initial({
    required String serverUrl,
    required int userId,
  }) => DeleteConfirmationState(
        noUse: false,
        deleteEnabled: false,
        deleteFailure: false,
        deleteSuccess: false,
        authRepository: IAuthRepository(serverUrl: serverUrl),
        userId: userId,
      );
}

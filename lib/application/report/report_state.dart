part of 'report_cubit.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool noUse,
    required String name,
    required String type,
    required String id,
    required TextEditingController reportDescController,
    required bool isEnableSubmit,
    required UserRepository userRepository,
  }) = _ReportState;
  factory ReportState.initial({
    required String serverUrl,
    required String name,
    required String id,
    required String type,
  }) =>
      ReportState(
        id: id,
        name: name,
        type:type,
        noUse: false,
        isLoading: false,
        isFailure: false,
        isSuccess: false,
        isEnableSubmit: false,
        reportDescController: TextEditingController(),
        userRepository: IUserRepository(serverUrl: serverUrl),
      );
}

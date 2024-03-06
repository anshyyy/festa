part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState(
      {required bool isLoading,
      required bool isFailed,
      required bool isSuccessful,
      required String responseMsg,
      required NotificationRepository notificationRepository,
      required List<NotificationDto> lsOfNotification}) = _NotificationState;

  factory NotificationState.initial({
    required String apiBaseUrl,
  }) =>
      NotificationState(
        isFailed: false,
        isLoading: false,
        isSuccessful: false,
        lsOfNotification: [],
        notificationRepository: INotificationRepository(serverUrl: apiBaseUrl),
        responseMsg: '',
      );
}

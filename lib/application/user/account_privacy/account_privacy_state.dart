part of 'account_privacy_cubit.dart';

@freezed
class AccountPrivacyState with _$AccountPrivacyState {
  const factory AccountPrivacyState({
    required bool isPrivate,
  }) = _AccountPrivacy;
  factory AccountPrivacyState.initial() => const AccountPrivacyState(
        isPrivate: false,
      );
}

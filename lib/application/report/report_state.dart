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
    required double rating,
    required List<String> selectedTags,
    required List<String> tags,
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
        type: type,
        noUse: false,
        isLoading: false,
        isFailure: false,
        rating: 0,
        tags: [
          'Clean And Tidy 🫧',
          'Drinks 🍻',
          'Food is fire 🔥',
          'Friendly Staff 👫',
          'Location 📍',
          'Lighting ⚡️',
          'Vibe 💃🏼',
          'Excellent Service 💁🏻',
          'Good Crowd 👯‍♀️',
          'Value for money 💰',
          'Awesome Music 🎧'
        ],
        selectedTags: [],
        isSuccess: false,
        isEnableSubmit: false,
        reportDescController: TextEditingController(),
        userRepository: IUserRepository(serverUrl: serverUrl),
      );
}

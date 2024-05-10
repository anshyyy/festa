part of 'club_profile_cubit.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ClubProfileState with _$ClubProfileState {
  const factory ClubProfileState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccessful,
    required String responseMsg,
    required GlobalKey key,
    required int clubId,
    required double viewPortHeight,
    required int currentImageIndex,
    required ScrollController scrollController,
    required ScrollController parentController,
    required bool isAtTop,
    required String apiBaseUrl,
    required PubRepository pubRepository,
    required List<String> images,
    required int page,
    required DraggableScrollableController dragController,
    required List<AssetDto> assets,
    PubDto? pub,
    required UserRepository userRepository,
    required bool isFollowing,
    required bool isBlocked,
    required bool openPhotoViewer,
    required bool showHeader,
  }) = _ClubProfileState;

  factory ClubProfileState.initial(
          {required int clubId, required String apiBaseUrl}) =>
      ClubProfileState(
        key: GlobalKey(),
        viewPortHeight: 274,
        dragController: DraggableScrollableController(),
        showHeader: false,
        currentImageIndex: 0,
        scrollController: ScrollController(),
        parentController: ScrollController(),
        apiBaseUrl: apiBaseUrl,
        isAtTop: false,
        images: [],
        clubId: clubId,
        isBlocked: false,
        userRepository: IUserRepository(serverUrl: apiBaseUrl),
        pubRepository: IPubRepository(serverUrl: apiBaseUrl),
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
        responseMsg: '',
        isFollowing: false,
        page: 1,
        assets: [],
        openPhotoViewer: false,
      );
}

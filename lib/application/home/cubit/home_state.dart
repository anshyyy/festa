part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required List<String> imageList,
    required List<String> categoriesList,
    required List<Map<String, dynamic>> exploreList,
    required PageController pageController,
    required int selectedImageIndex,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
        pageController: PageController(),
        imageList: [
          AssetConstants.techno,
          AssetConstants.bollywood,
          AssetConstants.ladiesNight,
          AssetConstants.edm,
          AssetConstants.themeNights,
          AssetConstants.punjabi,
          AssetConstants.telugu
        ],
        categoriesList: [
          'Techno',
          'Bollywood',
          'Ladies night',
          'EDM',
          'Theme nights',
          'Punjabi',
          'Telugu'
        ],
        exploreList: [
          {
            'svgIcon': AssetConstants.filterIcon,
            'label': 'Filter',
          },
          {
            'label': 'Today',
          },
          {
            'label': 'This weekend',
          },
          {
            'svgIcon': AssetConstants.arrowDown,
            'label': 'Sort',
          },
          {
            'label': 'Date',
          },
          {
            'svgIcon': AssetConstants.heartOutlinedIcon,
          }
        ],
        selectedImageIndex: 0,
      );
}

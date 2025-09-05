part of 'main_nav_cubit.dart';

@freezed
class MainNavState with _$MainNavState {
  const factory MainNavState({
    required int currentIndex,
    required bool  isTabLoading,
    required bool  isGoToTop,
    required bool showNavBar,
  }) = _MainNavState;
  
  factory MainNavState.initial({
    required int currentIndex,
  }) => MainNavState(currentIndex: currentIndex,
  isTabLoading: false,
  isGoToTop: false,
  showNavBar: true
  );
}

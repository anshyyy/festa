part of 'main_nav_cubit.dart';

@freezed
class MainNavState with _$MainNavState {
  const factory MainNavState({
    required int currentIndex,
  }) = _MainNavState;
  
  factory MainNavState.initial({
    required int currentIndex,
  }) => MainNavState(currentIndex: currentIndex);
}

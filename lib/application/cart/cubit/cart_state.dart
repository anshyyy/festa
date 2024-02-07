part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required List<String> imageList,
    required CarouselController imageCarouselController,
  }) = _CartState;

  factory CartState.initial() => CartState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
        imageList: [
          AssetConstants.homeBobsBarImg,
          AssetConstants.homeBobsBarImg,
          AssetConstants.homeBobsBarImg,
          AssetConstants.homeBobsBarImg,
          AssetConstants.homeBobsBarImg,
          AssetConstants.homeBobsBarImg,
        ],
        imageCarouselController: CarouselController(),
      );
}

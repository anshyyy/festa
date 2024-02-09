part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required List<String> imageList,
    required int selectedImageIndex,
  }) = _CartState;

  factory CartState.initial() => const CartState(
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
        selectedImageIndex: 0,
      );
}

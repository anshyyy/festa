part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool noUse,
  }) = _CartState;

  factory CartState.initial() => const CartState(
        noUse: false,
        isLoading: false,
        isFailure: false,
        isSuccess: false,
      );
}

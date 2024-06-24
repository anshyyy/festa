import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_nav_state.dart';
part 'main_nav_cubit.freezed.dart';

class MainNavCubit extends Cubit<MainNavState> {
  MainNavCubit(super.initialState);

  void onIndexChange({required int index}) async {
    emit(state.copyWith(
      currentIndex: index,
    ));
  }

  void emitFromAnywhere(MainNavState state) async {
    emit(state);
  }
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_privacy_state.dart';
part 'account_privacy_cubit.freezed.dart';

class AccountPrivacyCubit extends Cubit<AccountPrivacyState> {
  AccountPrivacyCubit() : super(AccountPrivacyState.initial());
  
  void switchAccount({required bool isPrivate}){
    emit(state.copyWith(isPrivate: isPrivate));
  }
}

import 'package:ecommerce_flutter/ui/model/ui_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
sealed class SignInState with _$SignInState {
  const factory SignInState({
    @Default(false) bool isLoading,
    @Default('') String userEmail,
    @Default('') String userPassword,
    UiError? uiError,
  }) = _SignInState;
}

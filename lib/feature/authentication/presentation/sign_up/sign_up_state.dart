import 'package:ecommerce_flutter/ui/model/ui_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
sealed class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(false) bool isLoading,
    @Default('') String userName,
    @Default('') String userEmail,
    @Default('') String userPassword,
    @Default('') String userConfirmPassword,
    @Default(false) bool shouldNavigateToPreviousScreen,
    UiError? uiError,
}) = _SignUpState;
}

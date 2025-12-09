import 'package:ecommerce_flutter/feature/authentication/data/repository/authentication_repository.dart';
import 'package:ecommerce_flutter/feature/authentication/domain/model/sign_up_request.dart';
import 'package:ecommerce_flutter/feature/authentication/presentation/sign_up/sign_up_state.dart';
import 'package:ecommerce_flutter/ui/model/ui_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;

  void onUserNameTextChanged(String value) {
    emit(state.copyWith(userName: value));
  }

  void onUserEmailTextChanged(String value) {
    emit(state.copyWith(userEmail: value));
  }

  void onUserPasswordTextChanged(String value) {
    emit(state.copyWith(userPassword: value));
  }

  void onUserConfirmPasswordTextChanged(String value) {
    emit(state.copyWith(userConfirmPassword: value));
  }

  Future<void> clickedOnSignUpButton() async {
    if (state.isLoading) {
      return;
    }

    emit(state.copyWith(isLoading: true));

    final signUpRequest = SignUpRequest(
      name: state.userName,
      email: state.userEmail,
      password: state.userPassword,
    );

    await _authenticationRepository.doSignUp(data: signUpRequest)
      ..onSuccess((_) {
        emit(
          state.copyWith(
            isLoading: false,
            shouldNavigateToPreviousScreen: true,
          ),
        );

        emit(state.copyWith(shouldNavigateToPreviousScreen: false));
      })
      ..onFailure((exception) {
        emit(
          state.copyWith(
            isLoading: false,
            uiError: ScreenUiError(
              text: exception.toString(),
            ),
          ),
        );

        emit(state.copyWith(uiError: null));
      });
  }
}

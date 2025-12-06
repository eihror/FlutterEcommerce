import 'package:ecommerce_flutter/feature/authentication/data/repository/authentication_repository.dart';
import 'package:ecommerce_flutter/feature/authentication/domain/model/sign_in_request.dart';
import 'package:ecommerce_flutter/feature/authentication/presentation/sign_in/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(const SignInState());

  final AuthenticationRepository _authenticationRepository;

  void onUserEmailTextChanged(String value) {
    emit(state.copyWith(userEmail: value));
  }

  void onUserPasswordTextChanged(String value) {
    emit(state.copyWith(userPassword: value));
  }

  Future<void> clickedOnSignInButton() async {
    if (state.isLoading) {
      return;
    }

    emit(state.copyWith(isLoading: true));

    final signInRequest = SignInRequest(
      email: state.userEmail,
      password: state.userPassword,
    );

    await _authenticationRepository.doSignIn(data: signInRequest)
      ..onSuccess((_) {
        emit(state.copyWith(isLoading: false));
      })
      ..onFailure((exception) {
        emit(state.copyWith(isLoading: false));
      });
  }
}

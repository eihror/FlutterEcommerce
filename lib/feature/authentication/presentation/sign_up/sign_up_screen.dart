import 'package:ecommerce_flutter/core/extension/string_extension.dart';
import 'package:ecommerce_flutter/core/mixin/text_localization_mixin.dart';
import 'package:ecommerce_flutter/feature/authentication/presentation/sign_up/sign_up_cubit.dart';
import 'package:ecommerce_flutter/feature/authentication/presentation/sign_up/sign_up_state.dart';
import 'package:ecommerce_flutter/ui/component/ef_scaffold.dart';
import 'package:ecommerce_flutter/ui/component/ef_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpView();
}

class _SignUpView extends State<SignUpScreen> with TextLocalizationMixin {
  final _signUpFormKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _confirmPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SignUpCubit>(),
      child: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.uiError != null && context.mounted) {
            EFSnackBarController().showError(context, state.uiError!.text);
          }

          if (state.shouldNavigateToPreviousScreen) {
            context.pop();
          }
        },
        child: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            final cubit = context.read<SignUpCubit>();
            return EFScaffold(
              isLoading: state.isLoading,
              appBar: AppBar(),
              body: Form(
                key: _signUpFormKey,
                child: Padding(
                  padding: const .all(16),
                  child: Column(
                    mainAxisSize: .min,
                    crossAxisAlignment: .stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: textLocalization.ui.inputNameLabel,
                          hintText: textLocalization.ui.inputNameHint,
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return textLocalization.ui.errorInvalidName;
                          }
                          return null;
                        },
                        onChanged: cubit.onUserNameTextChanged,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: textLocalization.ui.inputEmailLabel,
                          hintText: textLocalization.ui.inputEmailHint,
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || !value.isValidEmail) {
                            return textLocalization.ui.errorInvalidEmail;
                          }
                          return null;
                        },
                        onChanged: cubit.onUserEmailTextChanged,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        obscureText: !_passwordVisible,
                        autovalidateMode: .onUserInteraction,
                        decoration: InputDecoration(
                          labelText: textLocalization.ui.inputPasswordLabel,
                          hintText: textLocalization.ui.inputPasswordHint,
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return textLocalization.ui.errorInvalidPassword;
                          }

                          return null;
                        },
                        onChanged: cubit.onUserPasswordTextChanged,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        obscureText: !_confirmPasswordVisible,
                        autovalidateMode: .onUserInteraction,
                        decoration: InputDecoration(
                          labelText:
                              textLocalization.ui.inputConfirmPasswordLabel,
                          hintText: textLocalization.ui.inputPasswordHint,
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _confirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _confirmPasswordVisible =
                                    !_confirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value != state.userPassword) {
                            return textLocalization
                                .ui
                                .errorInvalidConfirmPassword;
                          }

                          return null;
                        },
                        onChanged: cubit.onUserConfirmPasswordTextChanged,
                      ),
                      const SizedBox(height: 8),
                      FilledButton(
                        onPressed: () async {
                          if (_signUpFormKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            await cubit.clickedOnSignUpButton();
                          }
                        },
                        child: Text(textLocalization.ui.buttonCreateAccount),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

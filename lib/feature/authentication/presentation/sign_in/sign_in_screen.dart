import 'package:ecommerce_flutter/core/extension/string_extension.dart';
import 'package:ecommerce_flutter/core/mixin/text_localization_mixin.dart';
import 'package:ecommerce_flutter/feature/authentication/presentation/navigation/authentication_routes.dart';
import 'package:ecommerce_flutter/feature/authentication/presentation/sign_in/sign_in_cubit.dart';
import 'package:ecommerce_flutter/feature/authentication/presentation/sign_in/sign_in_state.dart';
import 'package:ecommerce_flutter/feature/home/presentation/navigation/home_routes.dart';
import 'package:ecommerce_flutter/ui/component/ef_scaffold.dart';
import 'package:ecommerce_flutter/ui/component/ef_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInView();
}

class _SignInView extends State<SignInScreen> with TextLocalizationMixin {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SignInCubit>(),
      child: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state.uiError != null && context.mounted) {
            EFSnackBarController().showError(context, state.uiError!.text);
          }

          if (state.shouldNavigateToHomeScreen) {
            context.go(HomeRoute().path);
          }
        },
        child: BlocBuilder<SignInCubit, SignInState>(
          builder: (context, state) {
            final cubit = context.read<SignInCubit>();
            return EFScaffold(
              isLoading: state.isLoading,
              body: SafeArea(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const .all(16),
                    child: Column(
                      mainAxisSize: .min,
                      crossAxisAlignment: .stretch,
                      children: [
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
                            if (value == null || value.isEmpty) {
                              return textLocalization.ui.errorInvalidPassword;
                            }
                            return null;
                          },
                          onChanged: cubit.onUserPasswordTextChanged,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          spacing: 16,
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () =>
                                    context.push(SignUpRoute().path),
                                child: Text(
                                  textLocalization.ui.buttonCreateAccount,
                                ),
                              ),
                            ),
                            Expanded(
                              child: FilledButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    await cubit.clickedOnSignInButton();
                                  }
                                },
                                child: Text(textLocalization.ui.buttonSignIn),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Flexible(
                          child: TextButton(
                            onPressed: () {
                              // TODO(eihror): Implement this later
                            },
                            child: Text(
                              textLocalization.ui.buttonForgotPassword,
                            ),
                          ),
                        ),
                      ],
                    ),
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

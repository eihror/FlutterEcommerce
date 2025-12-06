import 'package:ecommerce_flutter/core/extension/string_extension.dart';
import 'package:ecommerce_flutter/core/mixin/text_localization_mixin.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
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
                    if (value != null && !value.isValidEmail) {
                      return textLocalization.ui.errorInvalidEmail;
                    }
                    return null;
                  },
                  onChanged: (value) {},
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
                  onChanged: (value) {},
                ),
                const SizedBox(height: 12),
                Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // TODO(igor.melo): Implement this later
                        },
                        child: Text(
                          textLocalization.ui.buttonCreateAccount,
                        ),
                      ),
                    ),
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            /*
                             TODO(eihror): Do something if all fields are valid
                             */
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
                      // TODO(igor.melo): Implement this later
                    },
                    child: Text(textLocalization.ui.buttonForgotPassword),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

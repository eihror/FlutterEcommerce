import 'package:ecommerce_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

mixin TextLocalizationMixin {
  static AppLocalizations? _textLocalization;

  AppLocalizations get textLocalization =>
      TextLocalizationMixin._textLocalization!;

  static void init({required BuildContext context}) {
    _textLocalization = AppLocalizations.of(context);
  }
}

import 'package:ecommerce_flutter/feature/authentication/presentation/l10n/authentication_localizations.dart';
import 'package:ecommerce_flutter/feature/product/presentation/l10n/product_localizations.dart';
import 'package:ecommerce_flutter/ui/l10n/ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  const AppLocalizations({
    required this.locale,
    required this.authentication,
    required this.ui,
    required this.product,
  });

  final Locale locale;
  final AuthenticationLocalizations authentication;
  final UiLocalizations ui;
  final ProductLocalizations product;

  static Future<AppLocalizations> load(Locale locale) async {
    final authentication = await AuthenticationLocalizations.delegate.load(
      locale,
    );
    final ui = await UiLocalizations.delegate.load(locale);
    final product = await ProductLocalizations.delegate.load(locale);

    return AppLocalizations(
      locale: locale,
      authentication: authentication,
      ui: ui,
      product: product,
    );
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
    Locale('pt', 'BR'),
  ];
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'pt'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

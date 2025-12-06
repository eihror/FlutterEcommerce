import 'package:ecommerce_flutter/feature/authentication/presentation/l10n/authentication_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  const AppLocalizations({
    required this.locale,
    required this.authentication,
  });

  final Locale locale;
  final AuthenticationLocalizations authentication;

  static Future<AppLocalizations> load(Locale locale) async {
    final authentication = await AuthenticationLocalizations.delegate.load(
      locale,
    );

    return AppLocalizations(
      locale: locale,
      authentication: authentication,
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

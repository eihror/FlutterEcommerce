import 'package:ecommerce_flutter/core/enum/app_environment_banner.dart';
import 'package:ecommerce_flutter/core/mixin/text_localization_mixin.dart';
import 'package:ecommerce_flutter/l10n/app_localizations.dart';
import 'package:ecommerce_flutter/navigation/navigation_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget with TextLocalizationMixin {
  const App({
    AppEnvironmentBanner? appEnvironmentBanner,
    super.key,
  }) : _appEnvironmentBanner = appEnvironmentBanner;

  final AppEnvironmentBanner? _appEnvironmentBanner;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      localeResolutionCallback: (locale, supportedLocales) {
        if (!supportedLocales.contains(locale)) {
          return supportedLocales.first;
        } else {
          return locale;
        }
      },
      builder: (context, child) {
        TextLocalizationMixin.init(context: context);

        final Widget content;

        if (_appEnvironmentBanner != null) {
          content = Banner(
            message: _appEnvironmentBanner.name,
            location: .topEnd,
            color: _appEnvironmentBanner.color,
            child: child ?? const SizedBox.shrink(),
          );
        } else {
          content = child ?? const SizedBox.shrink();
        }

        return content;
      },
      routerConfig: navigationRouter,
    );
  }
}

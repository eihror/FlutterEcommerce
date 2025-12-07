import 'package:ecommerce_flutter/core/mixin/text_localization_mixin.dart';
import 'package:ecommerce_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../mock/mock_go_router.dart';

class CreateWidgetUnderTest extends StatelessWidget with TextLocalizationMixin {
  const CreateWidgetUnderTest({
    required this.goRouter,
    required this.screenToTest,
    this.enableTicker = false,
    super.key,
  });

  final MockGoRouter goRouter;
  final Widget screenToTest;
  final bool enableTicker;

  @override
  Widget build(BuildContext context) {
    /**
     * This ThickerMode widget will disable all animations on a widget tree
     */
    return TickerMode(
      enabled: enableTicker,
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          if (!supportedLocales.contains(locale)) {
            return supportedLocales.first;
          } else {
            return locale;
          }
        },
        builder: (context, child) {
          TextLocalizationMixin.init(context: context);
          return child ?? const SizedBox.shrink();
        },
        home: MockGoRouterProvider(goRouter: goRouter, child: screenToTest),
      ),
    );
  }
}

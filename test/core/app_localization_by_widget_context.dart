import 'package:ecommerce_flutter/l10n/app_localizations.dart';
import 'package:ecommerce_flutter/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

AppLocalizations appLocalizationsByWidgetContext({
  required WidgetTester tester,
  required Type type,
}) {
  final BuildContext context = tester.element(find.byType(type));
  return context.l10n;
}

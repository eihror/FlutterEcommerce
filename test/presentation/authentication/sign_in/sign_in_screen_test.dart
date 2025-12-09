// ignore_for_file: discarded_futures

import 'package:ecommerce_flutter/di/di.dart';
import 'package:ecommerce_flutter/feature/authentication/presentation/navigation/authentication_routes.dart';
import 'package:ecommerce_flutter/feature/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:ecommerce_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../core/app_localization_by_widget_context.dart';
import '../../../core/widget_test_method.dart';
import '../../../mock/mock_go_router.dart';

void main() {
  late AppLocalizations l10n;
  late List<String> errorFoundList;

  final mockRouter = MockGoRouter();

  setUp(() async {
    await DI.registerDependencies();
    GetIt.I.allowReassignment = true;
  });

  tearDown(() {
    GetIt.I.reset();
  });

  late Finder userEmailTextFormFieldFinder;
  late Finder userPasswordTextFormFieldFinder;
  late Finder signInButtonFinder;

  void registerAndValidateFields() {
    signInButtonFinder = find.widgetWithText(
      FilledButton,
      l10n.ui.buttonSignIn,
    );
    expect(signInButtonFinder, findsOneWidget);

    userEmailTextFormFieldFinder = find.widgetWithText(
      TextFormField,
      l10n.ui.inputEmailHint,
    );
    expect(userEmailTextFormFieldFinder, findsOneWidget);

    userPasswordTextFormFieldFinder = find.widgetWithText(
      TextFormField,
      l10n.ui.inputPasswordHint,
    );
    expect(userPasswordTextFormFieldFinder, findsOneWidget);
  }

  testWidgets('When user tries to Sign In with valid account', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      CreateWidgetUnderTest(
        goRouter: mockRouter,
        screenToTest: const SignInScreen(),
      ),
    );

    await tester.pump();

    l10n = appLocalizationsByWidgetContext(tester: tester, type: SignInScreen);

    registerAndValidateFields();

    await tester.enterText(
      userEmailTextFormFieldFinder,
      'john.doe@company.com',
    );
    await tester.enterText(userPasswordTextFormFieldFinder, '123abc@');

    await tester.tap(signInButtonFinder);

    await tester.pumpAndSettle(const Duration(seconds: 3));

    final possibleErrorList = [
      l10n.ui.errorInvalidEmail,
      l10n.ui.errorInvalidPassword,
    ];

    errorFoundList = possibleErrorList.where((errorMessage) {
      return find.text(errorMessage).evaluate().isNotEmpty;
    }).toList();

    expect(errorFoundList, isEmpty);

    verifyNever(() => mockRouter.go(SignUpRoute().path));
  });
}

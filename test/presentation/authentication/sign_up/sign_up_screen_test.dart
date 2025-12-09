// ignore_for_file: discarded_futures

import 'package:ecommerce_flutter/di/di.dart';
import 'package:ecommerce_flutter/feature/authentication/presentation/sign_up/sign_up_screen.dart';
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

  late Finder userNameTextFormFieldFinder;
  late Finder userEmailTextFormFieldFinder;
  late Finder userPasswordTextFormFieldFinder;
  late Finder userConfirmPasswordTextFormFieldFinder;
  late Finder signUpButtonFinder;

  void registerAndValidateFields() {
    signUpButtonFinder = find.widgetWithText(
      FilledButton,
      l10n.ui.buttonCreateAccount,
    );
    expect(signUpButtonFinder, findsOneWidget);

    userNameTextFormFieldFinder = find.widgetWithText(
      TextFormField,
      l10n.ui.inputNameHint,
    );
    expect(userNameTextFormFieldFinder, findsOneWidget);

    userEmailTextFormFieldFinder = find.widgetWithText(
      TextFormField,
      l10n.ui.inputEmailHint,
    );
    expect(userEmailTextFormFieldFinder, findsOneWidget);

    final passwordFinder = find.widgetWithText(
      TextFormField,
      l10n.ui.inputPasswordHint,
    );

    expect(
      passwordFinder,
      findsAtLeast(2),
    );

    userPasswordTextFormFieldFinder = passwordFinder.at(0);
    userConfirmPasswordTextFormFieldFinder = passwordFinder.at(1);
  }

  testWidgets('When user tries to Sign Up with valid account', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      CreateWidgetUnderTest(
        goRouter: mockRouter,
        screenToTest: const SignUpScreen(),
      ),
    );

    await tester.pump();

    l10n = appLocalizationsByWidgetContext(tester: tester, type: SignUpScreen);

    registerAndValidateFields();

    await tester.enterText(userNameTextFormFieldFinder, 'John Doe');
    await tester.enterText(
      userEmailTextFormFieldFinder,
      'john.doe@company.com',
    );
    await tester.enterText(userPasswordTextFormFieldFinder, '123abc@');
    await tester.enterText(userConfirmPasswordTextFormFieldFinder, '123abc@');

    await tester.tap(signUpButtonFinder);

    await tester.pumpAndSettle(const Duration(seconds: 3));

    final possibleErrorList = [
      l10n.ui.errorInvalidName,
      l10n.ui.errorInvalidEmail,
      l10n.ui.errorInvalidPassword,
      l10n.ui.errorInvalidConfirmPassword,
    ];

    errorFoundList = possibleErrorList.where((errorMessage) {
      return find.text(errorMessage).evaluate().isNotEmpty;
    }).toList();

    expect(errorFoundList, isEmpty);

    verify(mockRouter.pop).called(1);
  });
}

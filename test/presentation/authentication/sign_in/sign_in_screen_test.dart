import 'package:ecommerce_flutter/di/di.dart';
import 'package:ecommerce_flutter/feature/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:ecommerce_flutter/l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../../../core/app_localization_by_widget_context.dart';
import '../../../core/widget_test_method.dart';
import '../../../mock/mock_go_router.dart';

void main() {
  late AppLocalizations l10n;

  final mockRouter = MockGoRouter();

  setUp(() async {
    await DI.registerDependencies();
    GetIt.I.allowReassignment = true;
  });

  tearDown(() {
    GetIt.I.reset();
  });

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


  });
}

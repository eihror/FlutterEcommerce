import 'package:ecommerce_flutter/app.dart';
import 'package:ecommerce_flutter/bootstrap.dart';

Future<void> main() async {
  await bootstrap(
    () => const App(
      appEnvironmentBanner: .development,
    ),
  );
}

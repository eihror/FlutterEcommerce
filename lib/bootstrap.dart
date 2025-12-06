import 'dart:async';
import 'dart:developer';

import 'package:ecommerce_flutter/di/di.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(
      '${details.exceptionAsString()} \n ${details.stack}',
      name: 'FlutterError',
    );
  };

  try {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    await DI.registerDependencies();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  } catch (e) {
    log('App initialization failed: $e', name: 'Bootstrap');
    rethrow;
  } finally {
    runApp(await builder());
  }
}

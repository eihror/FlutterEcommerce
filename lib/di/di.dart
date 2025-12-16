import 'package:ecommerce_flutter/core/di/core_di.dart';
import 'package:ecommerce_flutter/feature/authentication/di/authentication_di.dart';
import 'package:ecommerce_flutter/feature/product/di/product_di.dart';
import 'package:get_it/get_it.dart';

class DI {
  static Future<void> registerDependencies() async {
    CoreDI.registerDependencies();
    AuthenticationDI.registerDependencies();
    ProductDI.registerDependencies();

    await GetIt.I.allReady();
  }
}

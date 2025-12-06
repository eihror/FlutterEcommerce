import 'package:ecommerce_flutter/feature/authentication/data/data_source/authentication_data_source.dart';
import 'package:ecommerce_flutter/feature/authentication/data/repository/authentication_repository.dart';
import 'package:get_it/get_it.dart';

class AuthenticationDI {
  static void registerDependencies() {
    GetIt.I.registerFactory(AuthenticationDataSource.new);

    GetIt.I.registerFactory(
      () => AuthenticationRepository(
        authenticationDatasource: GetIt.I(),
      ),
    );

    // TODO(eihror): Register dependencies
  }
}

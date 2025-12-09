import 'package:ecommerce_flutter/feature/authentication/data/data_source/authentication_data_source.dart';
import 'package:ecommerce_flutter/feature/authentication/data/repository/authentication_repository.dart';
import 'package:ecommerce_flutter/feature/authentication/presentation/sign_in/sign_in_cubit.dart';
import 'package:ecommerce_flutter/feature/authentication/presentation/sign_up/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

class AuthenticationDI {
  static void registerDependencies() {
    GetIt.I.registerFactory(AuthenticationDataSource.new);

    GetIt.I.registerFactory(
      () => AuthenticationRepository(
        authenticationDatasource: GetIt.I(),
      ),
    );

    GetIt.I.registerFactory(
      () => SignInCubit(
        authenticationRepository: GetIt.I(),
      ),
    );

    GetIt.I.registerFactory(
      () => SignUpCubit(
        authenticationRepository: GetIt.I(),
      ),
    );
  }
}

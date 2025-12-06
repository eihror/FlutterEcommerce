import 'package:ecommerce_flutter/feature/authentication/data/data_source/authentication_data_source.dart';

class AuthenticationRepository {
  AuthenticationRepository({
  required AuthenticationDataSource authenticationDatasource,
  }) : _authenticationDataSource = authenticationDatasource;

  final AuthenticationDataSource _authenticationDataSource;
}

import 'package:ecommerce_flutter/feature/authentication/data/data_source/authentication_data_source.dart';
import 'package:ecommerce_flutter/feature/authentication/domain/model/sign_in_request.dart';
import 'package:ecommerce_flutter/feature/authentication/domain/model/sign_up_request.dart';
import 'package:result_dart/result_dart.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    required AuthenticationDataSource authenticationDatasource,
  }) : _authenticationDataSource = authenticationDatasource;

  final AuthenticationDataSource _authenticationDataSource;

  AsyncResult<Unit> doSignIn({required SignInRequest data}) =>
      _authenticationDataSource.doSignIn(data: data);

  AsyncResult<Unit> doSignUp({required SignUpRequest data}) =>
      _authenticationDataSource.doSignUp(data: data);
}

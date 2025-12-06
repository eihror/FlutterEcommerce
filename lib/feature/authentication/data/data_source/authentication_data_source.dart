import 'package:ecommerce_flutter/feature/authentication/domain/model/sign_in_request.dart';
import 'package:result_dart/result_dart.dart';

class AuthenticationDataSource {
  AsyncResult<Unit> doSignIn({required SignInRequest data}) async {
    await Future<void>.delayed(const Duration(seconds: 3));

    return unit.toSuccess();
  }
}

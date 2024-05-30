import 'package:dio/dio.dart';
import 'package:mibloc/core/api/api_url.dart';
import 'package:mibloc/core/errors/exception.dart';
import 'package:mibloc/features/auth/data/models/login_model.dart';
import 'package:mibloc/features/auth/data/models/user_model.dart';

sealed class AuthRemoteDataSource {
  Future<AuthenticatedUserModel> signInWithEmailAndPassword(LoginModel params);
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> isSignedIn();
  Future<String> getUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio httpClient;

  const AuthRemoteDataSourceImpl(this.httpClient);

  @override
  Future<String> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> isSignedIn() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<AuthenticatedUserModel> signInWithEmailAndPassword(
      LoginModel model) async {
    try {
      final result = await httpClient.post(ApiUrl.login, data: model.toJson());

      return AuthenticatedUserModel.fromJson(result.data);
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.badResponse) {
          throw AuthException();
        } else {
          ServerException();
        }
      }
      throw ServerException();
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }
}

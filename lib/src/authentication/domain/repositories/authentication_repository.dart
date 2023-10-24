import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/src/authentication/domain/entities/user.dart';

abstract class AuthoenticationRepository {
  const AuthoenticationRepository();

  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  ResultFuture<List<User>> getUsers();
}

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/src/authentication/domain/entities/user.dart';

abstract class AuthoenticationRepository {
  const AuthoenticationRepository();

  ResultVoid createUser({
    required String createAt,
    required String name,
    required String avatar,
  });

  ResultFuture<List<User>> getUsers();
}

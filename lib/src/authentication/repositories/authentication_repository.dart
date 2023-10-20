import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/src/authentication/domain/entities/user.dart';

abstract class AuthoenticationRepository {
  const AuthoenticationRepository();

  Future<Either<Exception, void>> createUser({
    required String createAt,
    required String name,
    required String avatar,
  });

  Future<Either<Exception, List<User>>> getUsers();
}

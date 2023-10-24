import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/src/authentication/domain/entities/user.dart';
import 'package:flutter_application_1/src/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  @override
  ResultVoid createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
        final dataSource =
      }

  @override
  ResultFuture<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}

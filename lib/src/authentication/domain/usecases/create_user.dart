import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/src/authentication/domain/repositories/authentication_repository.dart';

class CreateUser {
  const CreateUser(this._repository);

  final AuthoenticationRepository _repository;

  ResultVoid createUser({
    required String createAt,
    required String name,
    required String avatar,
  }) async =>
      _repository.createUser(createAt: createAt, name: name, avatar: avatar);
}

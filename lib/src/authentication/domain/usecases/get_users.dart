import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/src/authentication/domain/entities/user.dart';
import 'package:flutter_application_1/src/authentication/domain/repositories/authentication_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  const GetUsers(this._repository);

  final AuthoenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/src/authentication/domain/repositories/authentication_repository.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthoenticationRepository _repository;

  @override
  ResultVoid call(CreateUserParams params) => _repository.createUser(
        createAt: params.createAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  const CreateUserParams(
      {required this.createAt, required this.name, required this.avatar});

  final String createAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [createAt, name, avatar];
}

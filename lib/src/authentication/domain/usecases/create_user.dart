import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/src/authentication/domain/repositories/authentication_repository.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultVoid call(CreateUserParams params) => _repository.createUser(
        createdAt: params.createAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  const CreateUserParams(
      {required this.createAt, required this.name, required this.avatar});

  const CreateUserParams.empty()
      : this(
            createAt: '_empty_string',
            name: '_empty.string',
            avatar: '_empty.string');

  final String createAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [createAt, name, avatar];
}

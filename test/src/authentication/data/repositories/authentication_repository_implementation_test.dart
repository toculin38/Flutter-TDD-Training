import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exceptions.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:flutter_application_1/src/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSrc extends Mock
    implements AuthenticationRemoteDataSource {}

void main() {
  late AuthenticationRemoteDataSource remoteDataSource;
  late AuthenticationRepositoryImplementation repoImpl;

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSrc();
    repoImpl = AuthenticationRepositoryImplementation(remoteDataSource);
  });

  const tExecption = APIException(
    message: 'unknown Error Occured',
    statusCode: 500,
  );

  group('createUser', () {
    const createdAt = 'whatever.createdAt';
    const name = 'whatever.name';
    const avatar = 'whatever.avatar';

    test(
        'should call [RemoteDataSource.createUser] and complete '
        'successfully when the call to the remote source is successful',
        () async {
      //arrange
      when(
        () => remoteDataSource.createUser(
            createdAt: any(named: 'createdAt'),
            name: any(named: 'name'),
            avatar: any(named: 'avatar')),
      ).thenAnswer((_) => Future.value());

      //act
      final result = await repoImpl.createUser(
          createdAt: createdAt, name: name, avatar: avatar);

      //assert
      expect(result, equals(Right(null)));
      verify(() => remoteDataSource.createUser(
          createdAt: createdAt, name: name, avatar: avatar)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test(
        'should return a [ServerFailure] when the call to the remote source is unsuccessful',
        () async {
      //arrange
      when(() => remoteDataSource.createUser(
            createdAt: any(named: 'createdAt'),
            name: any(named: 'name'),
            avatar: any(named: 'avatar'),
          )).thenThrow(tExecption);

      final expectdFailure = APIFailure(
          message: tExecption.message, statusCode: tExecption.statusCode);

      //act
      final result = await repoImpl.createUser(
          createdAt: createdAt, name: name, avatar: avatar);

      //assert
      expect(result, equals(Left(expectdFailure)));

      final verificationResult = verify(() => remoteDataSource.createUser(
          createdAt: createdAt, name: name, avatar: avatar));

      verificationResult.called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
  group('getUsers', () {
    test(
        'should call the [RemoteDataSource.getUsers] and return [List<User>] when call to remote source is successful',
        () async {
      when(() => remoteDataSource.getUsers()).thenAnswer(
        (_) async => [],
      );

      final result = await repoImpl.getUsers();
      expect(result, equals(const Right([])));
      final verificationResult = verify(() => remoteDataSource.getUsers());
      verificationResult.called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}

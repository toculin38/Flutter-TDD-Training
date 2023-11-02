import 'dart:convert';
import 'dart:math';

import 'package:flutter_application_1/core/errors/exceptions.dart';
import 'package:flutter_application_1/core/utils/constants.dart';
import 'package:flutter_application_1/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
  late http.Client client;
  late AuthenticationRemoteDataSource remoteDataSource;

  setUp(() {
    client = MockClient();
    remoteDataSource = AuthRemoteDataSrcImpl(client);
    registerFallbackValue(Uri());
  });

  group('createUser', () {
    const String createdAt = 'createdAt';
    const String name = 'name';
    const String avatar = 'avatar';

    test('should complete successfully when the status is 200 or 201',
        () async {
      //Arrange
      when(() => client.post(any(), body: any(named: 'body'))).thenAnswer(
          (_) async => http.Response('User created succesfully', 201));

      //Act
      final methodCall = remoteDataSource.createUser;
      //Assert
      expect(
          methodCall(
            createdAt: createdAt,
            name: name,
            avatar: avatar,
          ),
          completes);

      verify(
        () => client.post(
          Uri.parse('$kBaseUrl/$kCreateUserEndpoint'),
          body: jsonEncode({
            'createdAt': createdAt,
            'name': name,
            'avatar': avatar,
          }),
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should throw [APIException] when the status code is not 200 or 201',
        () async {
      const String message = 'User created failed';
      const int statusCode = 400;
      //Arrange
      when(() => client.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => http.Response(message, statusCode));

      //Act
      final methodCall = remoteDataSource.createUser;

      //Assert
      expect(
          methodCall(
            createdAt: createdAt,
            name: name,
            avatar: avatar,
          ),
          throwsA(
              const APIException(message: message, statusCode: statusCode)));
      verify(
        () => client.post(
          Uri.parse('$kBaseUrl/$kCreateUserEndpoint'),
          body: jsonEncode({
            'createdAt': createdAt,
            'name': name,
            'avatar': avatar,
          }),
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });
  });
}

import 'dart:convert';

import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/src/authentication/data/models/user_model.dart';
import 'package:flutter_application_1/src/authentication/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();
  test('should be a subclass of [User] entity', () {
    //Assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [UserModel] with the right data', () {
      //Act
      final result = UserModel.fromMap(tMap);
      //Assert
      expect(result, equals(tModel));
    });
  });

  group('fromJson', () {
    test('should return a [UserModel] with the right data', () {
      //Act
      final result = UserModel.fromJson(tJson);
      //Assert
      expect(result, equals(tModel));
    });
  });

  group('toMap', () {
    test('should return a [Map] with the right data', () {
      //Act
      final result = tModel.toMap();
      //Assert
      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('should return a [JSON] string with the right data', () {
      //Act
      final result = tModel.toJson();
      //Assert
      final decodedJson1 = json.decode(result);
      final decodedJson2 = json.decode(tJson);
      expect(decodedJson1, equals(decodedJson2));
    });
  });

  group('copyWith', () {
    test('should return a [UserModel] with different data', () {
      //Act
      final result = tModel.copyWith(name: 'Paul');
      expect(result.name, equals('Paul'));
    });
  });
}

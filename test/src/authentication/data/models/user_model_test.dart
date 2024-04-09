import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_tutorial/core/utils/typedef.dart';
import 'package:tdd_tutorial/src/authentication/data/models/user_model.dart';
import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();
  test('Should be a subclass of [User] entity', () {
    // Assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [UserModel] with the right data', () {
      // Act
      final result = UserModel.fromMap(tMap);
      expect(result, equals(tModel));
    });
  });

  group('fromJson', () {
    test('should return a [UserModel] with the right data', () {
      // Act
      final result = UserModel.fromJson(tJson);
      expect(result, equals(tModel));
    });
  });

  group('toMap', () {
    test('should return a [Map] with the right data', () {
      // Act
      final result = tModel.toMap();
      // Assert
      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('should return a [JSON] string with the right data', () {
      // Act
      final result = tModel.toJson();
      final tJson = jsonEncode({
        "id": "1",
        "name": "_empty.name",
        "avatar": "_empty.avatar",
        "createdAt": "_empty.createdAt"
      });
      // Assert
      expect(result, tJson);
    });
  });

  group('copyWith', () {
    test('should return a [UserModel] with different data', () {
      // Act
      final result = tModel.copyWith(name: 'Paul');
      // Assert
      expect(result.name, equals('Paul'));
    });
  });
}

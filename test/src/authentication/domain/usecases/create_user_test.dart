// What does the class depend on
// Answer -- AuthenticationRepository
// How can we create a fake version of the dependency
// Answer -- Use Mocktail
// How do we ccontrol what our dependencies do
// Answer -- Using the Mocktail's APIs

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_application_1/src/authentication/domain/repositories/authentication_repository.dart';

class MockAuthRepo extends Mock implements AuthoenticationRepository {}

void main() {
  test(
      'should call the [AuthRepo.createUser]',
      () async => {
            //Arrange

            //Act

            //Assert
          });
}

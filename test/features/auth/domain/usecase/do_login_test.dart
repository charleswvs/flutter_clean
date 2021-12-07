import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/error/failure.dart';
import 'package:flutter_clean/features/auth/auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DoLoginRepositoryMock extends Mock implements DoLoginRepository {}

void main() {
  DoLoginRepository _doLoginRepository = DoLoginRepositoryMock();

  DoLogin _doLogin = DoLogin(_doLoginRepository);

  test('Should login successfully', () async {
    when(
      () => _doLoginRepository.doLogin(
        email: 'test@email.com',
        password: '1234qwer',
      ),
    ).thenAnswer((_) async => Right(tUser));

    var result = await _doLogin(
        DoLoginParams(email: 'test@email.com', password: '1234qwer'));

    expect(result, isA<Right>());
    expect(result, Right(tUser));
    verify(
      () => _doLoginRepository.doLogin(
        email: 'test@email.com',
        password: '1234qwer',
      ),
    ).called(1);
    verifyNoMoreInteractions(_doLoginRepository);
  });

  test('Should not login', () async {
    when(
      () => _doLoginRepository.doLogin(
        email: 'test@email.com',
        password: '1234qwer',
      ),
    ).thenAnswer((_) async => Left(InvalidPasswordFailure()));

    var result = await _doLogin(
        DoLoginParams(email: 'test@email.com', password: '1234qwer'));

    expect(result, isA<Left>());
    expect(result, Left(InvalidPasswordFailure()));
    verify(
      () => _doLoginRepository.doLogin(
        email: 'test@email.com',
        password: '1234qwer',
      ),
    ).called(1);
    verifyNoMoreInteractions(_doLoginRepository);
  });
}

var tUser = User(
  bornDate: DateTime.now(),
  email: 'test@email.com',
  name: 'John Doe',
  pictureUrl: 'https://pictureuser.com./photo',
);

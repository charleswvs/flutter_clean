import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/error/failure.dart';
import 'package:flutter_clean/features/auth/auth.dart';
import 'package:flutter_clean/features/auth/data/datasource/do_login_data_source.dart';
import 'package:flutter_clean/features/auth/data/models/user_model.dart';
import 'package:flutter_clean/features/auth/data/repositories/do_login_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DoLoginDataSourceMock extends Mock implements DoLoginDataSource {}

void main() {
  DoLoginDataSource _dataSource = DoLoginDataSourceMock();
  DoLoginRepository _repository = DoLoginRepositoryImpl(_dataSource);

  test('Should login', () async {
    when(
      () => _dataSource.doLogin(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => tUser);

    var result = await _repository.doLogin(
      email: 't@email.com',
      password: 'senha.com',
    );

    expect(result, isA<Right>());
    expect(result, Right(tUser));

    verify(
      () => _dataSource.doLogin(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    );

    verifyNoMoreInteractions(_dataSource);
  });

  test('Should get an error when doing login', () async {
    when(
      () => _dataSource.doLogin(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenThrow(InvalidPasswordFailure());

    var result = await _repository.doLogin(
      email: 't@email.com',
      password: 'senha.com',
    );

    expect(result, isA<Left>());
    expect(result, Left(InvalidPasswordFailure()));

    verify(
      () => _dataSource.doLogin(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    );

    verifyNoMoreInteractions(_dataSource);
  });
}

var tUser = UserModel(
    bornDate: DateTime.now(),
    email: 'test@email.com',
    name: 'John Doe',
    pictureUrl: 'https://pictureuser.com./photo');

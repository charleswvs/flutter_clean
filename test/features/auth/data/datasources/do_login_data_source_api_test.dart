import 'package:dio/dio.dart';
import 'package:flutter_clean/core/error/failure.dart';
import 'package:flutter_clean/features/auth/data/datasource/do_login_data_source_api.dart';
import 'package:flutter_clean/features/auth/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  var dio = DioMock();
  var dataSource = DoLoginDataSourceApi(dio);
  test('Should do login on API', () async {
    when(
      () => dio.post(
        any(),
        data: {"email": 'test@email.com', "password": '123456'},
      ),
    ).thenAnswer(
      (_) => Future.value(
        Response(requestOptions: RequestOptions(path: ''), data: tUserApi),
      ),
    );

    UserModel user = await dataSource.doLogin(
      email: 'test@email.com',
      password: '123456',
    );
    expect(user.toMap(), tUserApi);

    verify(() => dio.post(any(),
        data: {"email": 'test@email.com', "password": '123456'})).called(1);
    verifyNoMoreInteractions(dio);
  });

  test('Should get error when trying do login with API', () async {
    when(
      () => dio.post(
        any(),
        data: {"email": 'test@email.com', "password": '123456'},
      ),
    ).thenThrow(ServerFailure());

    expect(
        () async => await dataSource.doLogin(
              email: 'test@email.com',
              password: '123456',
            ),
        throwsA(isA<ServerFailure>()));

    verify(() => dio.post(any(),
        data: {"email": 'test@email.com', "password": '123456'})).called(1);
    verifyNoMoreInteractions(dio);
  });
}

var tUserApi = {
  "bornDate": DateTime.now().toIso8601String(),
  "email": 'test@email.com',
  "name": 'John Doe',
  "pictureUrl": 'https://pictureuser.com./photo',
};

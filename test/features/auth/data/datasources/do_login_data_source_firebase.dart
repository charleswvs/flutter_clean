import 'package:flutter_clean/features/auth/data/datasource/do_login_data_source_firebase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var dataSource = DoLoginDataSourceFirebase();
  test('Should get error when trying do login with API', () async {
    expect(
        () async => await dataSource.doLogin(
              email: 'test@email.com',
              password: '123456',
            ),
        throwsA(isA<UnimplementedError>()));
  });
}

var tUserApi = {
  "bornDate": DateTime.now().toIso8601String(),
  "email": 'test@email.com',
  "name": 'John Doe',
  "pictureUrl": 'https://pictureuser.com./photo',
};

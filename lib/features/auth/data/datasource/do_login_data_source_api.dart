import 'package:flutter_clean/core/error/failure.dart';
import 'package:flutter_clean/features/auth/data/datasource/do_login_data_source.dart';
import 'package:flutter_clean/features/auth/data/models/user_model.dart';

class DoLoginDataSourceApi implements DoLoginDataSource {
  @override
  Future<UserModel> doLogin({required String email, required String password}) {
    try {
      return Future.value(
        UserModel.fromMap(tUserApi),
      );
    } catch (e) {
      throw (ServerFailure());
    }
  }
}

var tUserApi = {
  "bornDate": DateTime.now().toIso8601String(),
  "email": 'test@email.com',
  "name": 'John Doe',
  "pictureUrl": 'https://pictureuser.com./photo',
};

import 'package:flutter_clean/core/error/failure.dart';
import 'package:flutter_clean/features/auth/data/datasource/do_login_data_source.dart';
import 'package:flutter_clean/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';

class DoLoginDataSourceApi implements DoLoginDataSource {
  final Dio _dio;

  DoLoginDataSourceApi(this._dio);

  @override
  Future<UserModel> doLogin(
      {required String email, required String password}) async {
    try {
      var response = await _dio.post('http://www.api.com/user', data: {
        'email': email,
        'password': password,
      });
      return UserModel.fromMap(response.data);
    } catch (e) {
      throw (ServerFailure());
    }
  }
}

// var tUserApi = {
//   "bornDate": DateTime.now().toIso8601String(),
//   "email": 'test@email.com',
//   "name": 'John Doe',
//   "pictureUrl": 'https://pictureuser.com./photo',
// };

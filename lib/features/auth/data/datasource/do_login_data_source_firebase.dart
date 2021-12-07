import 'package:flutter_clean/features/auth/data/datasource/do_login_data_source.dart';
import 'package:flutter_clean/features/auth/data/models/user_model.dart';
import 'package:flutter_clean/features/auth/domain/entities/user.dart';

class DoLoginDataSourceFirebase implements DoLoginDataSource {
  @override
  Future<UserModel> doLogin({required String email, required String password}) {
    throw UnimplementedError();
  }
}

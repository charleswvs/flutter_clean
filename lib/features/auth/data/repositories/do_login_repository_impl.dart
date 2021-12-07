import 'package:flutter_clean/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean/features/auth/auth.dart';
import 'package:flutter_clean/features/auth/data/datasource/do_login_data_source.dart';

class DoLoginRepositoryImpl implements DoLoginRepository {
  final DoLoginDataSource _dataSource;

  DoLoginRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, User>> doLogin(
      {required String email, required String password}) async {
    try {
      var result = await _dataSource.doLogin(email: email, password: password);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}

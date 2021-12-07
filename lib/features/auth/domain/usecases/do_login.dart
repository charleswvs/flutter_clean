import 'package:flutter_clean/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/usecase/usecase.dart';
import 'package:flutter_clean/features/auth/domain/entities/user.dart';
import 'package:flutter_clean/features/auth/domain/repositories/do_login_repository.dart';

class DoLoginParams {
  final String email;
  final String password;

  DoLoginParams({required this.email, required this.password});
}

class DoLogin extends UseCase<User, DoLoginParams> {
  final DoLoginRepository _repository;

  DoLogin(this._repository);

  @override
  Future<Either<Failure, User>> call(DoLoginParams params) {
    return _repository.doLogin(email: params.email, password: params.password);
  }
}

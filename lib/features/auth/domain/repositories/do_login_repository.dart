import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/error/failure.dart';
import 'package:flutter_clean/features/auth/domain/entities/user.dart';

abstract class DoLoginRepository {
  Future<Either<Failure, User>> doLogin({
    required String email,
    required String password,
  });
}

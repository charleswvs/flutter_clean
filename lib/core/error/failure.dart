import 'package:equatable/equatable.dart';

class Failure extends Equatable implements Exception {
  final String? message;

  Failure({this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  @override
  String get message => "There's been a server error, try again later";
}

class NotFoundFailure extends Failure {
  @override
  String get message => "Requested resource not found";
}

class InvalidPasswordFailure extends Failure {
  @override
  String get message => "Invalid Password";
}

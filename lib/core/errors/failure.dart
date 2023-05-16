import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}

class AuthFail extends Failure {}

class StatusFail extends Failure {}

class ServerFailure extends Failure {}

class ConnectionFailure extends Failure {}

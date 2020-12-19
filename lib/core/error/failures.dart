import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class ConnectionFailure extends Failure {}

class ServiceFailure extends Failure {}

class PermissionFailure extends Failure {}

class LocationFailure extends Failure {}

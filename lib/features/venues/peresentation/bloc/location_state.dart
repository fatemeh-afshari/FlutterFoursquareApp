import 'package:equatable/equatable.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
@immutable
abstract class LocationState extends Equatable {
  @override
  List<Object> get props => [];
}
class EmptyLocation extends LocationState {}
class LoadingLocation extends LocationState {}
class LocationLoaded extends LocationState {
  final LocationData locationData;

  LocationLoaded({@required this.locationData});

  @override
  List<Object> get props => [locationData];
}
class LocationError extends LocationState {
  final String message;

  LocationError({@required this.message});

  @override
  List<Object> get props => [message];
}
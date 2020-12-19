import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LocationEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class GetUserLocation extends LocationEvent {
  @override
  List<Object> get props => [];
}

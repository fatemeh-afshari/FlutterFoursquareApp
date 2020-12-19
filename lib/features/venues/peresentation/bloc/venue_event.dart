import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class VenueEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetVenueForList extends VenueEvent {
  final int limit;
  final double lat;
  final double lng;
  final String query;

  GetVenueForList(
    this.limit,
    this.lat,
    this.lng,
    this.query,
  );

  @override
  List<Object> get props => [limit, lat, lng, query];
}

class GetVenueForDetail extends VenueEvent {
  final String id;

  GetVenueForDetail(this.id);

  @override
  List<Object> get props => [id];
}


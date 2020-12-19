import 'package:sixth_soloution_test/features/venues/data/models/list_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sixth_soloution_test/features/venues/domain/entities/venue.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/venue_repository.dart';

class GetVenuesList implements UseCase<List<Venue>, ListParams> {
  final VenueRepository repository;

  GetVenuesList(this.repository);

  @override
  Future<Either<Failure, List<Venue>>> call(ListParams params) async {
    return await repository.getVenuesList(
      params.limit,
      params.lat,
      params.lng,
      params.query,
    );
  }
}

class ListParams extends Equatable {
  final int limit;
  final double lat;
  final double lng;
  final String query;

  ListParams({
    @required this.limit,
    @required this.lat,
    @required this.lng,
    @required this.query,
  });

  @override
  List<Object> get props => [limit, lat, lng, query];
}

import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import '../../../../core/error/failures.dart';
import '../entities/venue.dart';

abstract class VenueRepository {
  Future<Either<Failure, List<Venue>>> getVenuesList(int limit , double lat , double lng , String query);
  Future<Either<Failure, Venue>> getVenueDetail(String id);
}
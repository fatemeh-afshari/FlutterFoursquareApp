import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:sixth_soloution_test/features/venues/domain/entities/venue.dart';
import '../../data/datasources/venue_remote_data_source.dart';
import '../../domain/repositories/venue_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';


class VenueRepositoryImpl implements VenueRepository {
  final VenueRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  VenueRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });
  @override
  Future<Either<Failure, Venue>> getVenueDetail(String id)async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getVenueDetail(id);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Venue>>> getVenuesList(int limit, double lat, double lng, String query)async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getVenuesList(limit, lat , lng , query);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

}
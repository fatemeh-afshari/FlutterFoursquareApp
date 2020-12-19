import 'package:sixth_soloution_test/features/venues/data/models/detail_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sixth_soloution_test/features/venues/domain/entities/venue.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/venue_repository.dart';

class GetVenueDetail implements UseCase<Venue, DetailParams> {
  final VenueRepository repository;

  GetVenueDetail(this.repository);

  @override
  Future<Either<Failure, Venue>> call(DetailParams params) async {
    return await repository.getVenueDetail(params.id);
  }
}

class DetailParams extends Equatable {
  final String id;

  DetailParams({
    @required this.id,
  });

  @override
  List<Object> get props => [id];
}

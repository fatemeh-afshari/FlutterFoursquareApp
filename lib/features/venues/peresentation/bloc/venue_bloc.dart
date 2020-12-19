import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:sixth_soloution_test/core/error/failures.dart';
import 'package:sixth_soloution_test/features/venues/domain/entities/venue.dart';
import 'package:sixth_soloution_test/features/venues/peresentation/bloc/venue_event.dart';
import 'package:sixth_soloution_test/features/venues/peresentation/bloc/venue_state.dart';
import '../../domain/usecases/get_venue_detail.dart';
import '../../domain/usecases/get_venues_list.dart';
import 'package:location/location.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class VenueBloc extends Bloc<VenueEvent, VenueState> {
  final GetVenuesList getVenuesList;
  final GetVenueDetail getVenueDetail;

  VenueBloc({
    @required GetVenuesList list,
    @required GetVenueDetail detail,
  })  : assert(list != null),
        assert(detail != null),
        getVenuesList = list,
        getVenueDetail = detail;

  @override
  VenueState get initialState => Empty();

  @override
  Stream<VenueState> mapEventToState(
    VenueEvent event,
  ) async* {
    if (event is GetVenueForList) {
      yield ListLoading();
      final failureOrList = await getVenuesList(ListParams(
        limit: event.limit,
        lat: event.lat,
        lng: event.lng,
        query: event.query,
      ));
      yield* _eitherListLoadedOrErrorState(failureOrList);
    } else if (event is GetVenueForDetail) {
      yield DetailLoading();
      final failureOrDetail = await getVenueDetail(DetailParams(id:event.id));
      yield* _eitherDetailLoadedOrErrorState(failureOrDetail);
    }
  }

  Stream<VenueState> _eitherListLoadedOrErrorState(
    Either<Failure, List<Venue>> failureOrList,
  ) async* {
    yield failureOrList.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (list) => ListLoaded(list: list),
    );
  }
  Stream<VenueState> _eitherDetailLoadedOrErrorState(
      Either<Failure, Venue> failureOrDetail,
      ) async* {
    yield failureOrDetail.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (detail) => DetailLoaded(detail: detail),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case ConnectionFailure:
        return CONNECTION_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}

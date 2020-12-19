import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sixth_soloution_test/core/error/failures.dart';
import 'package:location/location.dart';
import 'location_event.dart';
import 'location_state.dart';
const String PERMISSION_DENIED = 'permission denied , we use default latlng';
const String SERVICE_DISABLED = 'service disabled,, we use default latlng';
const String LOCATION_FAILURE = 'can not get location, we use default latlng';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  @override
  LocationState get initialState => EmptyLocation();

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    if (event is GetUserLocation) {
      yield LoadingLocation();
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          yield LocationError(message: _mapFailureToMessage(ServiceFailure()));
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          yield LocationError(
              message: _mapFailureToMessage(PermissionFailure()));
        }
      }
      _locationData = await location.getLocation();
      if (_locationData is LocationData) {
        yield LocationLoaded(locationData: _locationData);
      } else {
        yield LocationError(message: _mapFailureToMessage(LocationFailure()));
      }
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case PermissionFailure:
        return PERMISSION_DENIED;
      case ServiceFailure:
        return SERVICE_DISABLED;
      default:
        return 'Unexpected error';
    }
  }
}

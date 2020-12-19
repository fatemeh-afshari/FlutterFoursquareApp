import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sixth_soloution_test/features/venues/peresentation/bloc/location_bloc.dart';
import 'features/venues/data/datasources/venue_remote_data_source.dart';
import 'features/venues/data/repositories/venue_repository_impl.dart';
import 'features/venues/domain/repositories/venue_repository.dart';
import 'features/venues/domain/usecases/get_venue_detail.dart';
import 'features/venues/domain/usecases/get_venues_list.dart';
import 'features/venues/peresentation/bloc/bloc.dart';

import 'core/network/network_info.dart';
import 'core/util/input_convertor.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Venue
  // Bloc
  sl.registerFactory(
        () => VenueBloc(
      list: sl(),
      detail: sl(),
    ),
  );

  sl.registerFactory(
        () => LocationBloc(),
  );

  // Use cases
  sl.registerLazySingleton(() => GetVenuesList(sl()));
  sl.registerLazySingleton(() => GetVenueDetail(sl()));

  // Repository
  sl.registerLazySingleton<VenueRepository>(
        () => VenueRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<VenueRemoteDataSource>(
        () => VenueRemoteDataSourceImpl(client: sl()),
  );


  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
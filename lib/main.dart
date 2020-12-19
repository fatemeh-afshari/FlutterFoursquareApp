import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixth_soloution_test/features/venues/peresentation/routers/route_names.dart';
import 'features/venues/peresentation/bloc/location_bloc.dart';
import 'features/venues/peresentation/bloc/venue_bloc.dart';
import 'features/venues/peresentation/routers/custom_route.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<LocationBloc>(create: (_) => sl<LocationBloc>()),
        BlocProvider<VenueBloc>(create: (_) => sl<VenueBloc>()),
      ],
      child:MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '6thSolution',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(34, 72, 202, 1),
        buttonColor: Color(0xff384FFF),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute:CustomRouter.allRoute,
      initialRoute:mapRoute,
    );
  }
}



import 'package:flutter/material.dart';
import 'package:sixth_soloution_test/features/venues/peresentation/pages/detail_page.dart';
import 'package:sixth_soloution_test/features/venues/peresentation/pages/map_page.dart';
import 'package:sixth_soloution_test/features/venues/peresentation/routers/route_names.dart';

class CustomRouter {
  static Route<dynamic> allRoute(RouteSettings settings) {
    switch (settings.name) {

      case mapRoute:
        return MaterialPageRoute(builder: (_) => MapPage());
      case detailRoute:
        return MaterialPageRoute(builder: (_) => DetailPage(id:settings.arguments.toString()));
    }
    //TODO unknown route
  }
}
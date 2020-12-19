import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sixth_soloution_test/features/venues/data/models/list_model.dart';
import 'package:sixth_soloution_test/features/venues/peresentation/bloc/bloc.dart';
import 'package:sixth_soloution_test/features/venues/peresentation/widgets/custom_button.dart';
import 'package:sixth_soloution_test/features/venues/peresentation/widgets/list_item.dart';
import 'package:sixth_soloution_test/features/venues/peresentation/widgets/loading_widget.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  LatLng _center = const LatLng(45.521563, -122.677433);
  List<VenueListModel> retrivedList = [];
  bool firstTime = true;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addMarker(LatLng latLng, String id) {
    final MarkerId markerId = MarkerId(id);
    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: latLng,
      onTap: () {
        retrivedList
            .firstWhere((element) => id == element.id)
            .changeColor(Colors.grey);
        retrivedList.where((element) => id != element.id).forEach((element) {
          element.changeColor(Colors.white);
        });
      },
    );
    // adding a new marker to map
    markers[markerId] = marker;
  }

  @override
  void didChangeDependencies() {
    if (firstTime) {
      firstTime = false;
      BlocProvider.of<LocationBloc>(context).add(GetUserLocation());
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //navigation
    //Navigator.pushNamed(context, detailRoute)
    return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
        ),
        body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer<VenueBloc, VenueState>(
          builder: (context, state) {
            return GoogleMap(
              markers: Set<Marker>.of(markers.values),
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 12.0,
              ),
              onCameraMove: (position) {
                _center = position.target;
              },
              myLocationEnabled: true,
            );
          },
          listener: (context, state) {
            if (state is ListLoaded) {
              markers.clear();
              for (var element in state.list) {
                _addMarker(
                  LatLng(element.location.lat, element.location.lng),
                  element.id,
                );
              }
            }
          },
        ),
        Center(
          child: Image(
            image: AssetImage('assets/images/marker.png'),
            height: 48,
            width: 48,
          ),
        ),
        BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            if (state is LoadingLocation) {
              return Center(
                child: LoadingWidget(),
              );
            } else if (state is LocationLoaded) {
              mapController.moveCamera(CameraUpdate.newLatLng(LatLng(
                  state.locationData.latitude, state.locationData.longitude)));
              BlocProvider.of<VenueBloc>(context).add(GetVenueForList(
                  3,
                  state.locationData.latitude,
                  state.locationData.longitude,
                  "hospital"));
            } else if (state is LocationError) {
              WidgetsBinding.instance.addPostFrameCallback((_)=> showDialog(
                context: context,
                builder: (BuildContext context)  {
                  return  SimpleDialog(
                    title: Text("${state.message}"),
                    children: [
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context);
                          BlocProvider.of<VenueBloc>(context).add(
                              GetVenueForList(3, _center.latitude,
                                  _center.longitude, "hospital"));
                        },
                        child: Text("OK"),
                      )
                    ],
                  );
                },
              ));

             // return Text("${state.message}");
            }
            return SizedBox(
              width: 0,
              height: 0,
            );
          },
        ),
        CustomButton(
          function: addButtonListener,
        ),
        BlocBuilder<VenueBloc, VenueState>(
          condition: (previous, current) =>
              !(previous is DetailLoading || current is DetailLoading),
          builder: (context, state) {
            if (state is ListLoading) {
              return Center(child: LoadingWidget());
            } else if (state is ListLoaded) {
              retrivedList = state.list;
              return ListWidget(retrivedList: retrivedList);
            } else if (state is Error) {
              return Text("${state.message}");
            }
            return SizedBox(
              height: 0,
              width: 0,
            );
          },
        ),
      ],
    );
  }

  void addButtonListener() {
    BlocProvider.of<VenueBloc>(context).add(
        GetVenueForList(3, _center.latitude, _center.longitude, "hospital"));
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key key,
    @required this.retrivedList,
  }) : super(key: key);

  final List<VenueListModel> retrivedList;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      left: 5,
      right: 5,
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: ListView.builder(
          itemCount: retrivedList.length,
          itemBuilder: (context, index) => ChangeNotifierProvider(
              create: (context) => retrivedList[index], child: ListItem()),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

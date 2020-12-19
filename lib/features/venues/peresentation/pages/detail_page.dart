import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixth_soloution_test/features/venues/peresentation/bloc/bloc.dart';
import 'package:sixth_soloution_test/features/venues/peresentation/widgets/loading_widget.dart';

class DetailPage extends StatefulWidget {
  final String id;

  DetailPage({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool firstTime = true;

  @override
  void didChangeDependencies() {
    if (firstTime) {
      firstTime = false;
      BlocProvider.of<VenueBloc>(context).add(GetVenueForDetail(widget.id));
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocBuilder<VenueBloc, VenueState>(
      builder: (context, state) {
        if (state is DetailLoading) {
          return Center(
            child: LoadingWidget(),
          );
        } else if (state is DetailLoaded) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("Detail Page"),
                  background: Image(
                    width: double.infinity,
                    image: AssetImage("assets/images/map.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      state.detail.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${state.detail.location.country},${state.detail.location.city},${state.detail.location.address}",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "*SCROLL UP FOR ANIMATION*",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 800,
                    )
                  ],
                ),
              ),
            ],
          );
        } else if (state is Error) {
          return Center(child: Text(state.message));
        }
        return SizedBox(
          height: 0,
          width: 0,
        );
      },
    );
  }

}

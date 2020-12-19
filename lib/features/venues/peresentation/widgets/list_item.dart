import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sixth_soloution_test/features/venues/data/models/list_model.dart';
import 'package:sixth_soloution_test/features/venues/peresentation/routers/route_names.dart';

import 'loading_widget.dart';

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VenueListModel element = Provider.of<VenueListModel>(context);
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, detailRoute, arguments: element.id),
      child: Card(
        color: element.color,
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Flexible(
                flex: 7,
                child: SizedBox(
                  child: Image(
                    image: NetworkImage(element.categories[0].icon.prefix +
                        element.categories[0].icon.suffix),
                    errorBuilder: (context, error, stackTrace) => Image(
                      image: AssetImage("assets/images/error.png"),
                    ),
                    loadingBuilder: (context, child, loadingProgress) =>
                        LoadingWidget(),
                  ),
                  // height: 60,
                ),
              ),
              Flexible(
                child: Text(element.name),
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

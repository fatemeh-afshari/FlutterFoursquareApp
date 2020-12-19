import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function function;

  const CustomButton({
    Key key,
    @required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: RaisedButton(
        child: Text(
          'Search this area',
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.green,
        onPressed: (){function();},
      ),
      top: 5,
      left: 70,
      right: 70,
    );
  }
}

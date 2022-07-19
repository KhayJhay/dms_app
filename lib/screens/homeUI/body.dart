import 'package:dms_app/screens/homeUI/header_with_searchbox.dart';
import 'package:flutter/material.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
       children: <Widget>[
         HeaderWithSearchBox(
           size: size,
           key: null,
         ),
       ],
      ),
    );
  }
}

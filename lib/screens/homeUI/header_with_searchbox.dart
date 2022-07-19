import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HeaderWithSearchBox extends StatefulWidget {
  HeaderWithSearchBox({
    required Key? key,
    required this.size,

  }) : super(key: key);

  final Size size;
  @override
  _HeaderWithSearchBoxState createState() => _HeaderWithSearchBoxState();
}

class _HeaderWithSearchBoxState extends State<HeaderWithSearchBox> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: 20*2.5),
      height: widget.size.height* 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 56,
            ),
            height: widget.size.height*0.2 - 27,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF01C3CD),
                Color(0xFF1D95DA),
              ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(36),
                bottomLeft: Radius.circular(36),
              ),
            ),

          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(child:
                  TextField(
                    onChanged: (value){},
                    decoration: InputDecoration(
                      hintText: "Search For Products",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  ),
                  Icon(
                    CupertinoIcons.search,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product_View_Page extends StatefulWidget {
  static String id = 'product_page';
  const Product_View_Page({Key? key}) : super(key: key);

  @override
  State<Product_View_Page> createState() => _Product_View_PageState();
}

class _Product_View_PageState extends State<Product_View_Page> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Container(
                    height: _height * 0.50,
                    width: _width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF01C3CD),
                          Color(0xFF7D2AE7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        stops: [0.0, 0.8],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 50.0,
                                  left: 20,
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(CupertinoIcons.back),
                                      color: Colors.white,
                                      iconSize: 30,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          130,
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        onPressed: () {
                                        },
                                        icon: const Icon(
                                          CupertinoIcons.star_fill,
                                          color: Colors.white,
                                        ),
                                        iconSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage("assets/images/mac.jpg",
                                          ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    height: 250,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
            bottom: 0,
            child: Container(
              height: _height * 0.52,
              width: _width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

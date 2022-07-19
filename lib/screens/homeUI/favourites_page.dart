import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favourites_Page extends StatefulWidget {
  static String id = 'favourites_page';
  const Favourites_Page({Key? key}) : super(key: key);

  @override
  State<Favourites_Page> createState() => _Favourites_PageState();
}

class _Favourites_PageState extends State<Favourites_Page>
    with SingleTickerProviderStateMixin{

  late TabController _tabController;

  int bottomTab = 0;

  var key;

  late int currentIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }


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
                    height: _height * 0.40,
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
                                      child: Text(
                                        "Favourites",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontFamily: 'Poppins-Light',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        onPressed: () {
                                        },
                                        icon: const Icon(
                                          CupertinoIcons.cart_fill,
                                          color: Colors.white,
                                        ),
                                        iconSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
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
              height: _height * 0.82,
              width: _width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      height: 32,
                      child: TabBar(
                        onTap: (newIndex) {
                          print(newIndex);
                          setState(() {
                            currentIndex = newIndex;
                          });
                        },
                        unselectedLabelStyle: TextStyle(
                          color: Colors.deepPurple.shade300,
                          fontSize: 16,
                        ),
                        labelStyle: TextStyle(
                            color: Colors.teal,
                            fontSize: 20,
                            fontFamily: 'Poppins-Light'),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.teal,
                        isScrollable: true,
                        labelColor: Colors.teal,
                        unselectedLabelColor: Colors.grey,
                        controller: _tabController,
                        tabs: <Widget>[
                          Tab(
                            text: "Ads",
                          ),
                          Tab(
                            text: "Searches",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      height: 400,
                      child: TabBarView(
                        children: [
                          Favourite_Adds(),
                          Favourite_Searches(),
                        ],
                        controller: _tabController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Favourite_Adds extends StatelessWidget {
  const Favourite_Adds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text("No Favourite Ads Yet"),
        ),
      ],
    );
  }
}

class Favourite_Searches extends StatelessWidget {
  const Favourite_Searches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text("No Favourite Searches Yet"),
        ),
      ],
    );
  }
}


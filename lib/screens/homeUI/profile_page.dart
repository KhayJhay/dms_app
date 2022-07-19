import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Profile_Page extends StatefulWidget {
  const Profile_Page({Key? key}) : super(key: key);

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  @override
  Widget build(BuildContext context)  {
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
                    height: _height * 0.4,
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
                                        "My Profile",
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
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Container(
                        height: 200,
                        width: _width,
                        decoration: BoxDecoration(
                          color: Color(0xFF4273DA).withOpacity(.15),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                child: Icon(CupertinoIcons.person,
                                  size: 30,
                                  color:Color(0xFF4273DA),
                                ),
                                backgroundColor: Colors.white ,
                                radius: 32,
                              ),
                            ),
                            Text(
                              "Hernolds Mensah",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14.sp,
                                  fontFamily: 'Poppins-Bold'),

                            ),
                            Padding(padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Icon(CupertinoIcons.phone,size: 30,color: Color(0xFF4273DA),),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("0547232044",style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12.sp,
                                            fontFamily: 'Poppins-Light'),),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(CupertinoIcons.location,size: 30,color: Color(0xFF4273DA),),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Lapaz",style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12.sp,
                                            fontFamily: 'Poppins-Light'),),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(CupertinoIcons.mail,size: 30,color: Color(0xFF4273DA),),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Hernolds@gm..",style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12.sp,
                                            fontFamily: 'Poppins-Light'),),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    GridView.count(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 8, bottom: 0),
                      crossAxisCount: 3,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xFF01C3CD),
                                        Color(0xFF7D2AE7),],
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter,
                                    ),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4,
                                      )
                                    ]),
                                child: IconButton(
                                  icon: Icon(
                                    CupertinoIcons.square_favorites,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {

                                  },
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "My Ads",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF4273DA),
                              ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xFF01C3CD),
                                        Color(0xFF7D2AE7),],
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter,
                                    ),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4,
                                      )
                                    ]),
                                child: IconButton(
                                  icon: Icon(
                                    CupertinoIcons.heart,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Favourites",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color:Color(0XFF4273DA),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              GestureDetector(
                                child: Container(
                                  height: 64,
                                  width: 64,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xFF01C3CD),
                                        Color(0xFF7D2AE7),],
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter,
                                    ),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4,
                                      )
                                    ],
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      CupertinoIcons.cart_fill,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: () {

                                    },
                                  ),
                                ),
                                onTap: () {
                                },
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Purchases",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  color: Color(0XFF4273DA),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4,
                                      )
                                    ],
                                    gradient: LinearGradient(
                                      colors: [Color(0xFF01C3CD),
                                        Color(0xFF7D2AE7),],
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter,
                                    ),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                  icon: Icon(
                                    CupertinoIcons.money_dollar,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Payments",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  color: Color(0XFF4273DA),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xFF01C3CD),
                                        Color(0xFF7D2AE7),],
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter,
                                    ),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                  icon: Icon(
                                    CupertinoIcons.bell_fill,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Notifications",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  color: Color(0XFF4273DA),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  height: 64,
                                  width: 64,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Color(0xFF01C3CD),
                                          Color(0xFF7D2AE7),],
                                        end: Alignment.topCenter,
                                        begin: Alignment.bottomCenter,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 3,
                                          spreadRadius: 4,
                                        )
                                      ],
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                    icon: Icon(
                                      CupertinoIcons.person_3,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                    },
                                  ),
                                ),
                                onTap: () {},
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "My Clients",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color:Color(0XFF4273DA),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 220.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.r),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 16.r,
                            color: Color(0xFF01C3CD).withOpacity(0.3),
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF01C3CD),
                            Color(0xFF1D95DA),
                          ],
                          end: Alignment.topLeft,
                          begin: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Text("LOGOUT",
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontFamily: 'Poppins-Light',
                              color: Colors.white
                          ),
                        ),
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

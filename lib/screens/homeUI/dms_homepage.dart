import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dms_app/screens/homeUI/categories/categories_page.dart';
import 'package:dms_app/screens/homeUI/favourites_page.dart';
import 'package:dms_app/screens/homeUI/home_page.dart';
import 'package:dms_app/screens/homeUI/product_view_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/user_model.dart';
import 'Chats&Messages/chats_page.dart';
class Dms_HomePage extends StatefulWidget {
  const Dms_HomePage({Key? key}) : super(key: key);

  @override
  State<Dms_HomePage> createState() => _Dms_HomePageState();
}

class _Dms_HomePageState extends State<Dms_HomePage> {
  int index = 0;

  final pages = <Widget>[
    Dms_HomePage(),
    Favourites_Page(),
    ChatsPage(),
  ];
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  bool isOpen = false;

  //getting users by default
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  Widget build(BuildContext context) {
    var userName = FirebaseAuth.instance.currentUser!.displayName;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.35.h,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF01C3CD),
                          Color(0xFF7D2AE7),
                        ],
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2.r,
                          blurRadius: 16.r,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ]),
                  child: Padding(
                    padding:
                    EdgeInsets.only(top: 60.0.h, left: 10.w, bottom: 15.h),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.0.w, left: 15.w),
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.person,
                                  color: Color(0xFF7D2AE7),
                                ),
                                radius: 25.r,
                                backgroundColor: Colors.white,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello,",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontFamily: 'Poppins-Light'),
                                ),
                                Text(
                                  "${loggedInUser.name
                                  }",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontFamily: 'Poppins-Light'),
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        CupertinoIcons.bell_fill,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        CupertinoIcons.cart_fill_badge_plus,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0.h),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50.r,
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  CupertinoIcons.search,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                  child: TextField(
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      hintText: "What Are You Looking For ?",
                                      hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Icon(
                                  CupertinoIcons.slider_horizontal_3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 200.h,
            child: Container(
              padding: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 25.h, bottom: 25.h),
              margin: EdgeInsets.symmetric(horizontal: 22.w),
              height: 160.h,
              width: MediaQuery.of(context).size.width - 40.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50.r,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/gm.jpg",
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.flame_fill,
                              color: Colors.red,
                            ),
                            Text(
                              "Hot Deals",
                              style:
                              TextStyle(color: Colors.red, fontSize: 16.sp),
                            ),
                          ],
                        ),
                        Text(
                          "Gaming Laptop",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins-Bold',
                              fontSize: 18.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0.w),
                          child: Container(
                            height: 40.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Center(
                              child: Text(
                                "Buy Now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins-Light',
                                    fontSize: 20.sp),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 385.h, left: 15.w, right: 15.w),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, Categories_Page.id);
                        },
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 74,
                                  width: 74,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF7D2AE7).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 3,
                                          spreadRadius: 4,
                                        )
                                      ]),
                                  child: Icon(
                                    CupertinoIcons.qrcode,
                                    size: 40,
                                    color: Color(0xFF7D2AE7),
                                  ),
                                ),
                              ),
                              Text(
                                "Categories",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Poppins-Light',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 74,
                                width: 74,
                                decoration: BoxDecoration(
                                    color: Color(0xFF7D2AE7).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(15.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4,
                                      )
                                    ]),
                                child: Icon(
                                  CupertinoIcons.rocket_fill,
                                  size: 40,
                                  color: Color(0xFF7D2AE7),
                                ),
                              ),
                            ),
                            Text(
                              "Trending",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins-Light',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 74,
                                width: 74,
                                decoration: BoxDecoration(
                                    color: Color(0xFF7D2AE7).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(15.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4,
                                      )
                                    ]),
                                child: Icon(
                                  CupertinoIcons.flame_fill,
                                  size: 40,
                                  color: Color(0xFF7D2AE7),
                                ),
                              ),
                            ),
                            Text(
                              "Popular",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins-Light',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 74,
                                width: 74,
                                decoration: BoxDecoration(
                                    color: Color(0xFF7D2AE7).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(15.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4,
                                      )
                                    ]),
                                child: Icon(
                                  CupertinoIcons.sparkles,
                                  size: 40,
                                  color: Color(0xFF7D2AE7),
                                ),
                              ),
                            ),
                            Text(
                              "Latest",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins-Light',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trending Products",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppins-SemiBold',
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "View More",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins-Semibold',
                                      color: Colors.grey
                                  ),
                                ))
                          ],
                        ),
                        TrendingCard(
                          item: "MacBook 2021",
                          image: 'assets/images/mac.jpg',
                          location: 'Ablekuma-Agape',
                          price: 'GHC 6000',
                          press: (){
                            Navigator.pushNamed(context, Product_View_Page.id);
                          },
                        ),
                        TrendingCard(
                          item: "Iphone 13pro",
                          image: 'assets/images/iphone.jpg',
                          location: 'Madina',
                          price: 'GHC 6500',
                          press: (){},
                        ),
                        TrendingCard(
                          item: "PlayStation 5",
                          image: 'assets/images/PS5.jpg',
                          location: 'Apenkwa',
                          price: 'GHC 5000',
                          press: (){},
                        ),
                        TrendingCard(
                          item: "Gaming Rig i7 ",
                          image: 'assets/images/gamingrig.jpg',
                          location: 'Kokomlemle',
                          price: 'GHC 8000',
                          press: (){},
                        ),
                        TrendingCard(
                          item: "Fifa 2022 PS5",
                          image: 'assets/images/fifap5.jpg',
                          location: 'East-Legon',
                          price: 'GHC 300',
                          press: (){},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:dms_app/screens/homeUI/Chats&Messages/chats_page.dart';
import 'package:dms_app/screens/homeUI/body.dart';
import 'package:dms_app/screens/homeUI/dms_homepage.dart';
import 'package:dms_app/screens/homeUI/favourites_page.dart';
import 'package:dms_app/screens/homeUI/profile_page.dart';
import 'package:dms_app/screens/homeUI/sellItems/seller_category_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final LocationData locationData;

  int index = 0;

  final pages = <Widget>[
    Dms_HomePage(),
    Favourites_Page(),
    ChatsPage(),
    Profile_Page(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, SellerCategoriesPage.id);
        },
        backgroundColor: Colors.white,
        tooltip: 'Publish?',
        child: Icon(Icons.add, color: Color(0xFF7D2AE7), size: 30,),),
      bottomNavigationBar: BottomNavBar_Widget(
        index: index,
        onChangedTab: onChangedTab,
      ),
    );
  }
  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
class BottomNavBar_Widget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;
  const BottomNavBar_Widget({
    Key? key,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);

  @override
  _BottomNavBar_WidgetState createState() => _BottomNavBar_WidgetState();
}

class _BottomNavBar_WidgetState extends State<BottomNavBar_Widget> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        gradient: LinearGradient(
          colors: [Color(0xFF01C3CD),
            Color(0xFF7D2AE7),],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          stops: [0.0, 0.8],
          tileMode: TileMode.clamp,
        ),
      ),
      child: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTabItem(
              index: 0,
              icon: Icon(CupertinoIcons.home,color: Colors.white),
            ),
            buildTabItem(
              index: 1,
              icon: Icon(CupertinoIcons.star,color: Colors.white),
            ),
            placeholder,
            buildTabItem(
              index: 2,
              icon: Icon(CupertinoIcons.chat_bubble_2_fill,color: Colors.white),
            ),
            buildTabItem(
              index: 3,
              icon: Icon(CupertinoIcons.person,color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildTabItem({
    required int index,
    required Icon icon,
  }){
    final isSelected = index == widget.index;
    return IconTheme(
        data: IconThemeData(
          color: isSelected ? Colors.red : Colors.black,
        ),
        child: IconButton(onPressed: () => widget.onChangedTab(index),
          icon: icon,));
  }

}
class TrendingCard extends StatelessWidget {
  const TrendingCard(
      {
        Key? key,
        required this.item,
        required this.image,
        required this.location,
        required this.price,
        required this.press,
      }) : super(key: key);
  final String item, image, location,price;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Container(
                height: 150.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 145.h,
                      width: 145.w,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius:
                        BorderRadius.circular(15.r),
                      ),
                      child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(15.r),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0),
                            child: new Text(
                              item,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Color(0xFF7D2AE7),
                                fontFamily:
                                'Poppins-Semibold',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0),
                            child: Text(
                              'Brand New',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'Poppins-Light',
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(CupertinoIcons.location),
                              Text(
                                location,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: 'Poppins-Light',
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 40.0.w, top: 3),
                            child: Text(
                              price,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins-Bold',
                                color: Color(0xFF7D2AE7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

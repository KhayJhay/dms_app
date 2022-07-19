import 'package:dms_app/authentication/get_started.dart';
import 'package:dms_app/provider/cat_provider.dart';
import 'package:dms_app/screens/homeUI/Chats&Messages/chats_page.dart';
import 'package:dms_app/screens/homeUI/categories/categories_page.dart';
import 'package:dms_app/screens/homeUI/categories/subCat_page.dart';
import 'package:dms_app/screens/homeUI/favourites_page.dart';
import 'package:dms_app/screens/homeUI/product_view_page.dart';
import 'package:dms_app/screens/homeUI/sellItems/products_form/Foods/sell_foods_form.dart';
import 'package:dms_app/screens/homeUI/sellItems/products_form/Foods/seller_review_page.dart';
import 'package:dms_app/screens/homeUI/sellItems/products_form/form_screen.dart';
import 'package:dms_app/screens/homeUI/sellItems/seller_category_list.dart';
import 'package:dms_app/screens/homeUI/sellItems/seller_subCat.dart';
import 'package:dms_app/screens/location_screen.dart';
import 'package:dms_app/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'authentication/login/login_screen.dart';
import 'package:dms_app/screens/homeUI/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
      providers:[
        Provider(create: (_) => CategoryProvider()),
      ],
      child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        title: 'DMS Online Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirebaseAuth.instance.currentUser == null
            ? SplashScreen()
            : HomePage(),
        routes: {
          HomePage.id: (context) => HomePage(),
          Favourites_Page.id: (context) => Favourites_Page(),
          ChatsPage.id: (context) => ChatsPage(),
          SellerCategoriesPage.id: (context) => SellerCategoriesPage(),
          Product_View_Page.id: (context) => Product_View_Page(),
          Categories_Page.id: (context) => Categories_Page(),
          SubCatList.id: (context) => SubCatList(),
          SellerSubCat.id: (context) => SellerSubCat(),
          Form_Screen.id: (context) => Form_Screen(),
          SellFoodForm.id: (context) => SellFoodForm(),
          SellerReviewScreen.id: (context) => SellerReviewScreen(),
        },
      ),
    );
  }
}

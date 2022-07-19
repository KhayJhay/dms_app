import 'package:dms_app/authentication/get_started.dart';
import 'package:dms_app/authentication/login/login_screen.dart';
import 'package:dms_app/screens/location_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 10),(){
          FirebaseAuth.instance.authStateChanges().listen((User? user) {
            if(user == null){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GetStarted()));
            }else{
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GetStarted()));
            }
          });
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                child: Image.asset("assets/pngs/dmslog1.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              CircularProgressIndicator(
                color: Color(0xff7A0CF3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

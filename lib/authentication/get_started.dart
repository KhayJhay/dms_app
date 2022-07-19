import 'package:dms_app/authentication/login/login_screen.dart';
import 'package:dms_app/authentication/phone/phoneauth_screen.dart';
import 'package:dms_app/authentication/services/google_auth.dart';
import 'package:dms_app/authentication/services/phoneauth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
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
              children: <Widget>[
                Container(
                  height: _height * 0.7,
                  width: _width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/bg3.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.75)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 60.0,
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 60,
                              left: 60,
                              right: 60,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/pngs/dmslog1.png"),
                                Padding(padding: EdgeInsets.all(20),
                                  child: Text("A Very Unique and Top Notch Ecommerce Platform",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Poppins-Regular",
                                      color: Colors.black38,
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
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: _height * 0.5,
              width: _width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF7A0CF3),
                      Color(0xFF01C3CD),
                    ],
                    end: Alignment.topLeft,
                    begin: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhoneAuthScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 18),
                          height: 60,
                          width: _width - 78,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 15,
                                    spreadRadius: 5),
                              ]),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Icon(CupertinoIcons.phone_solid, size: 25,color: Color(0xFF7A0CF3),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  "Continue With Phone",
                                  style: TextStyle(
                                      color: Color(0xFF7A0CF3),
                                      fontSize: 18,
                                      fontFamily: 'Poppins-Light',
                                     ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () async {
                         User? user = await GoogleAuthentication.signInWithGoogle(context: context);
                         if(user!=null){
                           PhoneAuthService _authentication = PhoneAuthService();
                           _authentication.addUser(context, user.uid);
                         }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 18),
                          height: 60,
                          width: _width - 78,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 15,
                                    spreadRadius: 5),
                              ]),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: FaIcon(FontAwesomeIcons.google, size: 25,color: Color(0xFF7A0CF3),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  "Continue With Google",
                                  style: TextStyle(
                                    color: Color(0xFF7A0CF3),
                                    fontSize: 18,
                                    fontFamily: 'Poppins-Light',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 18),
                          height: 60,
                          width: _width - 78,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 15,
                                    spreadRadius: 5),
                              ]),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: FaIcon(FontAwesomeIcons.apple, size: 25,color: Color(0xFF7A0CF3),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  "Continue With Apple",
                                  style: TextStyle(
                                    color: Color(0xFF7A0CF3),
                                    fontSize: 18,
                                    fontFamily: 'Poppins-Light',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins-Light',
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "Login with Email",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ))
                    ],
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

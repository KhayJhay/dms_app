import 'package:dms_app/authentication/register/register_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Register_Screen extends StatefulWidget {
  @override
  _Register_ScreenState createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: _height,
        width: _width,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 125.0,right: 125),
                  child: Column(
                    children: [
                      Image.asset("assets/pngs/dmslog1.png"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15, top: 15),
                child: Container(
                  height: 600,
                  width: _width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF01C3CD),
                        Color(0xFF7A00F3),
                      ],
                      end: Alignment.topLeft,
                      begin: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text("Create an account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Poppins-ExtraBold',
                              color: Colors.white,
                            ),),
                        ),
                       Padding(
                         padding: const EdgeInsets.only(top: 20.0, left: 30,right: 30),
                         child: RegisterForm(),
                       ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("or sign up with",style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins-Light',
                            color: Colors.white,
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top:4.0.w,right: 8.w),
                                      child: Container(
                                        width: 50.w,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(35.r),
                                            boxShadow: [
                                              BoxShadow(
                                                spreadRadius: 5.r,
                                                blurRadius: 16.r,
                                                color: Colors.white.withOpacity(0.3),
                                              ),
                                            ],
                                            color: Colors.white
                                        ),
                                        child: Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.phone,
                                            color:  Color(0xFF7A00F3),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:4.0,left: 10),
                                      child: Container(
                                        width: 50.w,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(35.r),
                                            boxShadow: [
                                              BoxShadow(
                                                spreadRadius: 5,
                                                blurRadius: 16,
                                                color: Colors.white.withOpacity(0.3),
                                              ),
                                            ],
                                            color: Colors.white
                                        ),
                                        child: Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.google,
                                            color:  Color(0xFF7A00F3),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have An Account?",style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                      color: Colors.black38,
                    ),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                      child: Text("Login",style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins-SemiBold',
                        color: Color(0xFF7A00F3),
                      ),),),
                  ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}

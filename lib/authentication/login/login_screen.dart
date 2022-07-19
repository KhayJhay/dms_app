import 'package:dms_app/authentication/login/login_form.dart';
import '../register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Container(
        height: _height.h,
        width: _width.w,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 80.0.h),
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
                padding: EdgeInsets.only(left: 15.0.w,right: 15.w, top: 15.h,),
                child: Container(
                  height: 500.h,
                  width: _width.w,
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
                          padding: EdgeInsets.only(top: 20.0.h),
                          child: Text("Login Account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24.sp,
                                fontFamily: 'Poppins-ExtraBold',
                                color:  Colors.white,
                            ),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0.h, left: 30.w,right: 30.w),
                          child: LoginForm(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.w),
                          child: Text("or sign in with",style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: 'Poppins-Light',
                            color: Colors.white
                          ),),
                        ),
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
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Don't Have An Account?",style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Poppins-Regular',
                      color: Colors.black38,
                  ),),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Register_Screen()));
                  },
                      child: Text("Register",style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Poppins-SemiBold',
                          color: Color(0xFF7A00F3),
                      ),),),
                ],),
              )
            ],
          ),
        ),
      )
    );
  }
}

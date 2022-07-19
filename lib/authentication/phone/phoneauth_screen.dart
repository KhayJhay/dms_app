import 'package:dms_app/authentication/phone/phone_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../register/register_screen.dart';
class PhoneAuthScreen extends StatelessWidget {
  static const String id = 'phone-auth-screen';
  const PhoneAuthScreen({Key? key}) : super(key: key);

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
            padding: EdgeInsets.only(top: 100.0.h),
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
                    height: 400.h,
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
                            child: Text("Enter Your Number",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontFamily: 'Poppins-ExtraBold',
                                color:  Colors.white,
                              ),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0.h,left: 70,right: 70),
                            child: Text("We will send a confirmation code to your phone",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Poppins-Light',
                                color:  Colors.white,
                              ),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.0.h, left: 30.w,right: 30.w),
                            child: Phoneform(),
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

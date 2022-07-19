import 'package:dms_app/authentication/phone/phoneauth_screen.dart';
import 'package:dms_app/screens/homeUI/dms_homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OTPScreen extends StatefulWidget {
  final String number, verId;
  const OTPScreen({
    Key? key,
    required this.number,
    required this.verId,
  }) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  var _text1 = TextEditingController();
  var _text2 = TextEditingController();
  var _text3 = TextEditingController();
  var _text4 = TextEditingController();
  var _text5 = TextEditingController();
  var _text6 = TextEditingController();

  Future<void>phoneCredential(BuildContext context, String otp, verId)async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try{
      PhoneAuthCredential credential = PhoneAuthProvider
          .credential(
          verificationId: widget.verId,
          smsCode: otp
      );
      final User? user = (await _auth.signInWithCredential(credential)).user;
      if(user!=null){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Dms_HomePage()));
      }
    }catch(e){

    }

  }

  @override

  Widget build(BuildContext context) {

    final node = FocusScope.of(context);

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
            padding: EdgeInsets.only(top: 200.0.h),
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
                    height: 350.h,
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
                            child: Text("OTP Verification",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontFamily: 'Poppins-ExtraBold',
                                color:  Colors.white,
                              ),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0.h,left: 70,right: 70),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'We sent a 6-digit code to ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'Poppins-Regular',
                                  color:  Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: widget.number,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: 'Poppins-Bold',
                                      color:  Colors.white,
                                    ),
                                  ),
                                ]
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 50,right: 50,top: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: _text1,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.deepOrangeAccent,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                    ),
                                    onChanged: (value){
                                      if(value.length==1){
                                        node.nextFocus();
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: _text2,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.deepOrangeAccent,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                    ),
                                    onChanged: (value){
                                      if(value.length==1){
                                        node.nextFocus();
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: _text3,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.deepOrangeAccent,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                    ),
                                    onChanged: (value){
                                      if(value.length==1){
                                        node.nextFocus();
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: _text4,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.deepOrangeAccent,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                    ),
                                    onChanged: (value){
                                      if(value.length==1){
                                        node.nextFocus();
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: _text5,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.deepOrangeAccent,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                    ),
                                    onChanged: (value){
                                      if(value.length==1){
                                        node.nextFocus();
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: _text6,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.deepOrangeAccent,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,),
                                        gapPadding: 10.w,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                    ),
                                    onChanged: (value){
                                      if(value.length==1){
                                        if(_text1.text.length == 1){
                                          if(_text2.text.length == 1){
                                            if(_text3.text.length == 1){
                                              if(_text4.text.length == 1){
                                                if(_text5.text.length == 1){
                                                  if(_text6.text.length == 1){
                                                    String _otp = '${_text1.text}${_text2.text}${_text3.text}${_text4.text}${_text5.text}${_text6.text}';
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 70,right: 70),
                            child: TextButton(onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PhoneAuthScreen()));
                            }, child: Text("Wrong number?, Edit",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'Poppins-Regular',
                                color:  Colors.orangeAccent,
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

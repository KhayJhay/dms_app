import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/phoneauth_services.dart';
class Phoneform extends StatefulWidget {
  const Phoneform({Key? key}) : super(key: key);

  @override
  State<Phoneform> createState() => _PhoneformState();
}

class _PhoneformState extends State<Phoneform> {
  final _formKey = GlobalKey<FormState>();
  var countryCodeCOntroller = TextEditingController(text: "+233",);
  var phoneNumerCOntroller = TextEditingController();
  bool remember = false;
  bool validate = false;
  final _auth = FirebaseAuth.instance;
  String counterText = '0';

  showAlertDialog(BuildContext context){
    AlertDialog alert =AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 20,),
          Text("Please wait")
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
        context: context, builder: (BuildContext context){
      return alert;
    });
  }

  PhoneAuthService _service = PhoneAuthService();

  void dispose(){
    showAlertDialog(context);
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {

    final phoneField = Row(
      children: [
       Expanded(
         flex: 1,
           child: TextFormField(
             controller: countryCodeCOntroller,
             decoration: InputDecoration(
               labelText: "country",
               enabled: false,
               counterText: '$counterText/10',
               fillColor: Colors.white,
               focusColor: Colors.white,
               hoverColor: Colors.white,
               labelStyle: TextStyle(
                   color: Colors.white
               ),
               hintStyle: TextStyle(
                   color: Colors.white
               ),
               border: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.white),
                 gapPadding: 10,
                 borderRadius: BorderRadius.circular(25),
               ),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.white),
                 gapPadding: 10,
                 borderRadius: BorderRadius.circular(25),
               ),
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.white),
                 gapPadding: 10,
                 borderRadius: BorderRadius.circular(25),
               ),
               floatingLabelBehavior: FloatingLabelBehavior.always,
             ),
           )),
        SizedBox(width: 10,),
        Expanded(
          flex: 3,
            child: TextFormField(
              autofocus: true,
              maxLength: 10,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.phone,
              controller: phoneNumerCOntroller,
              onChanged: (value){
                if(value.length==10){
                  setState(() {
                    validate =true;
                  });
                }
                if(value.length<10){
                  setState(() {
                    validate = false;
                  });
                }
              },
              decoration: InputDecoration(
                labelText: "number",
                labelStyle: TextStyle(
                    color: Colors.white
                ),
                hintText: "Enter your phone number",
                counterStyle: TextStyle(fontSize: 10, color: Colors.white),
                hintStyle: TextStyle(
                    color: Colors.white
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  gapPadding: 10,
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  gapPadding: 10,
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  gapPadding: 10,
                  borderRadius: BorderRadius.circular(25),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            )),
      ],
    ) ;
    final loginButton = InkWell(
      onTap: (){
        String number = '${countryCodeCOntroller.text}${phoneNumerCOntroller.text}';
        showAlertDialog(context);
        _service.verifyPhoneNumber(context, number);
      },
      child: AbsorbPointer(
        absorbing: validate ? false : true,
        child: Container(
          width: 220.w,
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.r),
            boxShadow: [
              BoxShadow(
                spreadRadius: 5,
                blurRadius: 16.r,
                color:Colors.white.withOpacity(0.3),
              ),
            ],
            color: validate == true ? Colors.white : Colors.grey,
          ),
          child: Center(
            child: Text("NEXT",
              style: TextStyle(
                fontSize: 24.sp,
                fontFamily: 'Poppins-Light',
                color: Colors.black38,
              ),
            ),
          ),
        ),
      ),
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          phoneField,
          SizedBox(height: 30.h),
          loginButton,
        ],
      ),
    );
  }
}

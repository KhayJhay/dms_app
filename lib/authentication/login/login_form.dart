import 'package:dms_app/screens/homeUI/home_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  var _emailController =  TextEditingController();
  var _passwordController =  TextEditingController();
  late String email;
  late String password;
  bool _loading = false;
  bool _validate = false;
  bool _login = false;
  bool remember = false;
  final _auth = FirebaseAuth.instance;

  _validateEmail(){
    if(_formKey.currentState!.validate()){
      setState(() {
        _validate =false;
        _loading =true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

   final emailField = TextFormField(
     autofocus: false,
     keyboardType: TextInputType.emailAddress,
     controller: _emailController,
     validator: (value){
       if(value==null || value.isEmpty)
       {
         return ("Please Enter Your Email");
       }
       if(!RegExp("^[a-zA-Z0-9+_,-]+@[a-zA-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
         return ("Please Enter a Valid Email");
       }
       return null;
     },
     onSaved: (value){
       _emailController.text =value!;
     },
     textInputAction: TextInputAction.next,
     decoration: InputDecoration(
       labelText: "Email",
       labelStyle: TextStyle(
         color: Colors.white,
       ),
       fillColor: Colors.white,
       hintText: "Enter your email",
       hintStyle: TextStyle(
         color: Colors.white,
       ),
       border: OutlineInputBorder(
         borderSide: BorderSide(color: Colors.white,),
         gapPadding: 10.w,
         borderRadius: BorderRadius.circular(25.r),
       ),
       focusedBorder: OutlineInputBorder(
         borderSide: BorderSide(color: Colors.white,),
         gapPadding: 10.w,
         borderRadius: BorderRadius.circular(25.r),
       ),
       enabledBorder: OutlineInputBorder(
         borderSide: BorderSide(color: Colors.white,),
         gapPadding: 10.w,
         borderRadius: BorderRadius.circular(25.r),
       ),
       // If  you are using latest version of flutter then lable text and hint text shown like this
       // if you r using flutter less then 1.20.* then maybe this is not working properly
       floatingLabelBehavior: FloatingLabelBehavior.always,
       suffixIcon: Icon(Icons.mail_sharp, color: Colors.white,),
     ),
   );
   final passwordField = TextFormField(
     autofocus: false,
     controller: _passwordController,
     obscureText: true,
     keyboardType: TextInputType.emailAddress,
     validator: (value){
       RegExp regex = RegExp(r'^.{6,}$');
       if (value!.isEmpty){
         return ("Password is required for login");
       }
       if(!regex.hasMatch(value))
       {
         return("Please Enter a Valid Password(Min. 6 Character)");
       }
     },
     onSaved: (value){
       _passwordController.text =value!;
     },
     textInputAction: TextInputAction.done,
     decoration: InputDecoration(
       labelText: "Password",
       labelStyle: TextStyle(
         color: Colors.white,
       ),
       fillColor: Colors.white,
       hintStyle: TextStyle(
         color: Colors.white,
       ),
       hintText: "Password",
       border: OutlineInputBorder(
         borderSide: BorderSide(color: Colors.white,),
         gapPadding: 10,
         borderRadius: BorderRadius.circular(25),
       ),
       focusedBorder: OutlineInputBorder(
         borderSide: BorderSide(color: Colors.white,),
         gapPadding: 10,
         borderRadius: BorderRadius.circular(25),
       ),
       enabledBorder: OutlineInputBorder(
         borderSide: BorderSide(color: Colors.white,),
         gapPadding: 10,
         borderRadius: BorderRadius.circular(25),
       ),
       // If  you are using latest version of flutter then lable text and hint text shown like this
       // if you r using flutter less then 1.20.* then maybe this is not working properly
       floatingLabelBehavior: FloatingLabelBehavior.always,
       suffixIcon: Icon(Icons.lock_open, color:Colors.white,),
     ),
   );
   final loginButton = InkWell(
     onTap: (){
       signIn(_emailController.text, _passwordController.text);
     },
     child:AbsorbPointer(
       absorbing: _validate ? false : true,
       child: Container(
         width: 220.w,
         height: 60.h,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(35.r),
           boxShadow: [
             BoxShadow(
               spreadRadius: 5,
               blurRadius: 16,
               color: Colors.white.withOpacity(0.3),
             ),
           ],
           color: _validate ? Colors.white : Colors.grey,
         ),
         child: Center(
           child: _loading ? SizedBox(
               height: 24,
               width: 24,
               child: CircularProgressIndicator()) : Text("LOGIN",
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
         emailField,
         SizedBox(height: 30.h),
         passwordField,
         SizedBox(height: 10.h),
         Padding(
           padding:  EdgeInsets.only(left: 5.0.w,right: 5.w,),
           child: Row(
             children: [
               Checkbox(
                 value: remember,
                 activeColor:  Colors.lightGreen,
                 checkColor:  Colors.white,
                 onChanged: (value) {
                   setState(() {
                     remember = value!;
                   });
                 },
               ),
               Text("Remember me",
                 style: TextStyle(
                   color: Colors.white,
                   fontFamily: 'Poppins-Regular',
                   fontWeight: FontWeight.w900,
                 ),
               ),
               GestureDetector(
                 child: Text(
                   "\n\nForgot Password",
                   style: TextStyle(decoration: TextDecoration.underline,
                     color:  Colors.white,
                     fontFamily: 'Poppins-Regular',
                     fontWeight: FontWeight.w900,
                   ),
                 ),
               ),
             ],
           ),
         ),
         SizedBox(height: 10.h),
         loginButton,
       ],
     ),
   );
  }
  void signIn(String email, String password) async {
    if(_formKey.currentState!.validate())
    {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Sign In Successful"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage())),
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
/*
emailLogin(email,password,context) async {

  try{
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    );
  } on FirebaseAuthException catch (e){
    if(e.code == 'user-not-found'){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No user found that email'),
        ),
      );
    }else if(e.code=='wrong-password'){
      print('Wrong password provided for that user');
    }
  }

}

*/
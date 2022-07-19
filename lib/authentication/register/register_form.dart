import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dms_app/screens/homeUI/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/user_model.dart';
class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _nameTEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final nameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  late String name;
  late String email;
  late String password;
  bool _loading = false;
  final _auth = FirebaseAuth.instance;
  bool _validate = false;

  _validateEmail(){
    if(_formKey.currentState!.validate()){
      setState(() {
        _validate = false;
        _loading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty){
          return ("Name Cannot be Empty");
        }
        if(!regex.hasMatch(value))
        {
          return("Please Enter Valid Name(Min. 3 Character)");
        }
      },
      onSaved: (value){
        nameEditingController.text =value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "Name",
        labelStyle: TextStyle(
            color: Colors.white
        ),
        fillColor: Colors.white,
        hintText: "Enter your name",
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
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person_rounded, color: Colors.white),
      ),
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty)
        {
          return ("Please Enter Your Email");
        }
        if(!RegExp("^[a-zA-Z0-9+_,-]+@[a-zA-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
          return ("Please Enter a Valid Email");
        }
        return null;
      },
      onSaved: (value){
        emailEditingController.text =value!;
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
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.mail_sharp, color: Colors.white,),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value){
        passwordEditingController.text =value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
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
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock_open, color: Colors.white,),
      ),
    );
    final confirmPasswordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: confirmPasswordEditingController,
      keyboardType: TextInputType.visiblePassword,
      validator: (value)
      {
        if(confirmPasswordEditingController.text !=
            passwordEditingController.text ){
          return "Password doesn't match";
        }
        return null;
      },
      onSaved: (value){
        confirmPasswordEditingController.text =value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        labelText: "Confirm Password",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.white,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        hintText: "Confirm Your Password",
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
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock_open, color: Colors.white,),
      ),
    );
    final registerButton = InkWell(
      onTap: (){
        _validateEmail();
        signUp(emailEditingController.text, passwordEditingController.text);
      },
      child: AbsorbPointer(
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
                child: CircularProgressIndicator()) : Text("REGISTER",
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
          nameField,
          SizedBox(height: 15.h),
          emailField,
          SizedBox(height: 15.h),
          passwordField,
          SizedBox(height: 15.h),
          confirmPasswordField,
          SizedBox(height: 20.h),
          registerButton,
        ],
      ),
    );
  }
  void signUp(String email, String password) async {
    if(_formKey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully");
    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) =>HomePage()), (route) => false);
  }
}


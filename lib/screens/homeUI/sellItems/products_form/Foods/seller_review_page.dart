import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../../models/user_model.dart';
import '../../../../../provider/cat_provider.dart';

class SellerReviewScreen extends StatefulWidget {
  static String id = 'seller-review-page';
  @override
  State<SellerReviewScreen> createState() => _SellerReviewScreenState();
}

class _SellerReviewScreenState extends State<SellerReviewScreen> {
  bool showPassword = false;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value){
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  Widget build(BuildContext context)  {
    final _formKey = GlobalKey<FormState>();
    var countryCodeCOntroller = TextEditingController(text: "+233",);
    var phoneNumerCOntroller = TextEditingController();
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    var _catProvider =  Provider.of<CategoryProvider>(context);


    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Container(
                    height: _height * 0.40,
                    width: _width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF01C3CD),
                          Color(0xFF7D2AE7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        stops: [0.0, 0.8],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 50.0,
                                  left: 20,
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(CupertinoIcons.back),
                                      color: Colors.white,
                                      iconSize: 30,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          130,
                                      child: const Text(
                                        "Review Your Ad",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'Poppins-Light',
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                      },
                                      icon: const Icon(CupertinoIcons.ellipsis_vertical),
                                      color: Colors.white,
                                      iconSize: 26,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Container(
              height: _height * 0.88,
              width: _width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40.0),
                        child: Center(
                          child: CircleAvatar(
                          child: FaIcon(FontAwesomeIcons.user, color: Colors.white, size: 50,),
                            radius: 60,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text("User Details",
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'Poppins-Medium',
                          ),
                        ),
                      ),
                      buildTextField("Full Name", "${loggedInUser.name}", false),
                      buildTextField("E-mail", "${loggedInUser.email}", false),
                      buildTextField("Location", "TLV, USA", false),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: countryCodeCOntroller,
                                decoration: InputDecoration(
                                  enabled: false,
                                  labelText: 'Country',
                                  fillColor: Colors.grey,
                                  focusColor: Colors.grey,
                                  hoverColor: Colors.grey,
                                  labelStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                  ),

                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                ),
                              )),
                          SizedBox(width: 10,),
                          Expanded(
                              flex: 3,
                              child: TextFormField(
                                autofocus: true,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.phone,
                                controller: phoneNumerCOntroller,
                                decoration: InputDecoration(
                                  hintText: "Enter your phone number",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                  ),
                                  labelText: 'Phone number',
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}



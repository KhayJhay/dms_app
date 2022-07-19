import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dms_app/screens/homeUI/sellItems/products_form/form_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../authentication/services/firebase_services.dart';
class SellerSubCat extends StatelessWidget {
  static String id = 'SellerSubCat';
  const SellerSubCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    DocumentSnapshot args = ModalRoute.of(context)!.settings.arguments as DocumentSnapshot;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Container(
                    height: _height * 0.4,
                    width: _width,
                    decoration: BoxDecoration(
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
                                      child: Text(
                                        args['catName'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontFamily: 'Poppins-Light',
                                        ),
                                      ),
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
          Positioned(
            bottom: 0,
            child: Container(
              height: _height * 0.86,
              width: _width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SubCatWidget(),
              )
            ),
          ),
        ],
      ),
    );
  }
}

class SubCatWidget extends StatelessWidget {
  const SubCatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DocumentSnapshot args = ModalRoute.of(context)!.settings.arguments as DocumentSnapshot;
    FirebaseService _service = FirebaseService();
    return Container(
      child: FutureBuilder<DocumentSnapshot>(
        future: _service.categories.doc(args.id).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Container();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }
          var data = snapshot.data!['subCat'];
          return Container(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Card(
                      child: ListTile(
                        onTap: (){
                          Navigator.pushNamed(context, Form_Screen.id);
                        },
                        title: Text(data[index], style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins-SemiBold',
                        ),),
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}


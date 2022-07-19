import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dms_app/screens/homeUI/categories/subCat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../authentication/services/firebase_services.dart';

class Categories_Page extends StatelessWidget {
  static String id = 'Categories_page';
  const Categories_Page({Key? key}) : super(key: key);

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
                children: [
                  Container(
                    height: _height * 0.4,
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
                                        "All Categories",
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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CategoryWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseService _service = FirebaseService();
    return Container(
      child: FutureBuilder<QuerySnapshot>(
        future: _service.categories.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Container();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }

          return Container(
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index){
              var doc = snapshot.data!.docs[index];
              return Padding(
                padding: EdgeInsets.all(8),
                child: Card(
                  child: ListTile(
                    onTap: (){
                      if(doc['subCat']==null){
                        return print('No Sub Categories');
                      }
                      Navigator.pushNamed(context, SubCatList.id, arguments: doc);
                    },
                    leading: Image.network(doc['image']),
                    title: Text(doc['catName'], style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins-SemiBold',
                    ),),
                    trailing: const Icon(CupertinoIcons.chevron_forward, size: 20,),
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


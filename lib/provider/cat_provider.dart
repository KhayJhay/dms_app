
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dms_app/authentication/services/firebase_services.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider with ChangeNotifier{
  FirebaseService _service = FirebaseService();
   DocumentSnapshot? doc;
   DocumentSnapshot? userDetails;
   String? selectedCategory;
   List<String> urlList = [];
   Map<String,dynamic> dataToFireStore = {};
  getCategory(selectedCat){
      selectedCategory = selectedCat;
    notifyListeners();
  }

  getCatSnapshot(snapshot){
      doc = snapshot;
    notifyListeners();
  }
  getImages(url){
    urlList.add(url);
    notifyListeners();
  }

  getData(data){
    dataToFireStore = data;
    notifyListeners();
  }

  getUserDetails(){
    _service.getUserData().then((value){
      this.userDetails = value;
      notifyListeners();
    });
  }

}
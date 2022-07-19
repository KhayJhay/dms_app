import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../provider/cat_provider.dart';


class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;
  bool _uploading = false;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if(pickedFile != null){
        _image = File(pickedFile.path);
      }else{
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<CategoryProvider>(context);
    double _width = MediaQuery.of(context).size.width;
    Future<String?> uploadFile() async {
      File file = File(_image!.path);
      String imageName = 'productImage/${DateTime.now().microsecondsSinceEpoch}';
      String? downloadUrl;
      try{
        await FirebaseStorage.instance
            .ref(imageName)
            .putFile(file);
        downloadUrl = await FirebaseStorage.instance
            .ref(imageName)
            .getDownloadURL();
        if(downloadUrl != null){
          setState(() {
            _image = null;
           _provider.getImages(downloadUrl);
          });
        }
      }on FirebaseException catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(
            const SnackBar(
              content: Text("Cancelled") ,));
      }
      return downloadUrl;
    }
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 250,
              width: _width,
              child: FittedBox(
                child: _image == null ? Lottie.asset("assets/lotties/pickimage.json"):Image.file(_image!),
              ),
            ),
        const SizedBox(height: 20,),
        if(_provider.urlList.length>0)
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF7D2AE7).withOpacity(.20),
            borderRadius: BorderRadius.circular(15),
          ),
            child: GalleryImage(imageUrls: _provider.urlList,)),
          const SizedBox(height: 30,),
            if(_image!=null)
            Row(
              children: [
                Expanded(
                  child:InkWell(
                  onTap: (){
                    setState(() {
                      _uploading = true;
                      uploadFile().then((url) {
                        if(url != null){
                          setState(() {
                            _uploading = false;
                          });
                        }
                      });
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF01C3CD),
                          Color(0xFF7D2AE7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        stops: [0.0, 0.8],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Icon(FontAwesomeIcons.check, size: 14,color: Colors.white,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Poppins-Light',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),),
                const SizedBox(width: 10,),
                Expanded(child:InkWell(
                  onTap: (){
                    getImage();
                  },
                  child: Container(
                    height: 50,
                    width: 60,
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Icon(FontAwesomeIcons.cancel, size: 14,color: Colors.white,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Poppins-Light',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),),
              ],
            ),
            const SizedBox(height: 30,), 
            InkWell(
              onTap: (){
                getImage();
              },
              child: Container(
                height: 60,
                width: 250,
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
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Icon(FontAwesomeIcons.upload, size: 25,color: Colors.white,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "Upload Image",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins-Light',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25,),
            if(_uploading)
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            )
          ],
        ),
      ),
    );
  }
}

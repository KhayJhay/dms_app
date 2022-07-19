import 'package:dms_app/screens/homeUI/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  Location location = new Location();

   bool? _serviceEnabled;
   PermissionStatus? _permissionGranted;
   LocationData? _locationData;

  Future<LocationData?>getLocation()async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
      _locationData = await location.getLocation();

    return _locationData;
  }

  @override
  Widget build(BuildContext context) {
    showBottomScreen(context){
      showBottomSheet(context: context,
          builder: (context){
        return Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              elevation: 1,
              backgroundColor: Colors.white,
            )
          ],
        );
          }
      );
    }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Lottie.asset('assets/lotties/location.json'),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20.0,right:20),
            child: Text("With Dms you can buy and \nsell anywhere",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
                fontFamily:
                'Poppins-ExtraBold',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text("Choose Your Location in you would, \nDms Offers You With Limitless and Wide \nRange of Options to Buy And Sell",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
                fontFamily:
                'Poppins-Regular',
              ),
            ),
          ),
          SizedBox(height: 12,),
          Column(
            children: [
              InkWell(
                onTap: (){
                  print(_locationData!.latitude);
                  getLocation().then((value){
                    if(value!=null){
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    }
                  });
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent
                  ),
                  child: Icon(
                    CupertinoIcons.location_fill,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Text("Around me",style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontFamily:
                'Poppins-Light',
              ),),
            ],
          ),
          Padding(padding: EdgeInsets.all(12),
            child: TextButton(
                onPressed: (){
                  showBottomScreen(context);
            }, child: Text("Set Location Manually", style: TextStyle(fontSize: 16),)),
          )
        ],
      ),
    );
  }
}

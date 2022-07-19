import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const _kPrimaryColor =  Color(0xFF7D2AE7);
const _kSecondaryColor =  Color(0xFF01C3CD);
const _kGradientColor =   LinearGradient(
  colors: [Color(0xFF01C3CD),
    Color(0xFF7D2AE7),],
  begin: Alignment.topLeft,
  end: Alignment.topRight,
  stops: [0.0, 0.8],
  tileMode: TileMode.clamp,
);
OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color:  Colors.grey),
    borderRadius: BorderRadius.circular(10.r),
  );
}

 List<String> _nutrientList = [
  'Low Carbohydrates',
  'High in Protein',
  'Vegetarian',
  'Low Fat',
  'Kosher',
  'Halal',
  'Detox',
  'Raw',
  'Low Sodium',
  'Other',
];

 List<String> _specialtyList = [
  'Sugar Free',
  'No Added Salt',
  'No Alcohol',
  'Fat Free',
  'Lactose Free',
  'No Preservatives',
  'No Artificial Colors',
  'Gluten Free',
  'No Artificial Flavour',
  'Other',
];



import 'package:dms_app/authentication/services/firebase_services.dart';
import 'package:dms_app/provider/cat_provider.dart';
import 'package:dms_app/screens/homeUI/sellItems/products_form/Foods/seller_review_page.dart';
import 'package:dms_app/widgets/image_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:provider/provider.dart';
import 'package:dms_app/constants.dart';

class SellFoodForm extends StatefulWidget {
  static String id = 'sell-food-form';

  @override
  State<SellFoodForm> createState() => _SellFoodFormState();
}

class _SellFoodFormState extends State<SellFoodForm> {

  final _formKey = GlobalKey<FormState>();

  FirebaseService _service = FirebaseService();

  var _typeController = TextEditingController();
  var _titleController = TextEditingController();
  var _areaController = TextEditingController();
  var _nutrientController = TextEditingController();
  var _dietaryController = TextEditingController();
  var _descController = TextEditingController();
  var _priceController = TextEditingController();

  validate(CategoryProvider provider){
    if(_formKey.currentState!.validate()){
      if(provider.urlList.isNotEmpty){
        provider.dataToFireStore.addAll({
          'category': provider.selectedCategory,
          'title': _titleController.text,
          'types': _typeController.text,
          'area': _areaController.text,
          'nutrients': _nutrientController.text,
          'dietary': _dietaryController.text,
          'description': _descController.text,
          'price': _priceController,
          'sellerUid': _service.user!.uid,
          'images' : provider.urlList,
        });
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No image uploaded"))
        );
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text("Please Complete required fields"))
      );
    }
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
  List<String> _areaList = [
    'Accra Metropolitan',
    'Tema Metropolitan',
    'Adenta',
    'Achimota',
    'Adabraka',
    'Abelempke',
    'Ablekuma',
    'Abossey Okai',
    'Agbogba',
    'Agbogbloshie',
    'Airport Residential',
    'Madina',
    'Akweteyman',
    'Awoshie',
    'Lapaz',
    'Kaneshie',
    'Circle',
    'Kasoa',
    'Kwashieman',
    'Legon',
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

  @override
  void didChangeDependencies() {
    var _catProvider =  Provider.of<CategoryProvider>(context);
    setState(() {
      _titleController.text = _catProvider.dataToFireStore.isEmpty ? null  : _catProvider.dataToFireStore['title'];
      _typeController.text = _catProvider.dataToFireStore.isEmpty ? null  : _catProvider.dataToFireStore['types'];
      _areaController.text = _catProvider.dataToFireStore.isEmpty ? null  : _catProvider.dataToFireStore['area'];
      _nutrientController.text= _catProvider.dataToFireStore.isEmpty ? null  : _catProvider.dataToFireStore['nutrients'];
      _dietaryController.text = _catProvider.dataToFireStore.isEmpty ? null  : _catProvider.dataToFireStore['specialty'];
      _descController.text = _catProvider.dataToFireStore.isEmpty ? null  : _catProvider.dataToFireStore['description'];
      _priceController.text = _catProvider.dataToFireStore.isEmpty ? null  : _catProvider.dataToFireStore['price'];
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    var _catProvider =  Provider.of<CategoryProvider>(context);

    Widget _appBar(title,fieldValue){
      return AppBar(
        backgroundColor: const Color(0xFF7D2AE7),
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: Text('$title~~$fieldValue', style: const TextStyle(color: Colors.white,fontSize: 15),),
      );
    }

    Widget _typeList(){
      return Dialog(
        child: Column(
          children: [
            _appBar(_catProvider.selectedCategory,'Types'),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemCount: _catProvider.doc?['types'].length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      title: Text(_catProvider.doc?['types'][index],),
                      onTap: (){
                        setState(() {
                          _typeController.text = _catProvider.doc?['types'][index];
                        });
                        Navigator.pop(context);
                      },
                    );
                  }),
            )
          ],
        ),
      );
    }

    Widget _listView({fieldValue,list,textController}){
      return Dialog(
        child: Column(
          children: [
            _appBar(_catProvider.selectedCategory,fieldValue),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      title: Text(list[index],),
                      onTap: (){
                        textController.text = list[index];
                        Navigator.pop(context);
                      },
                    );
                  }),
            )
          ],
        ),
      );
    }


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
                                        "Add Food Details",
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 20),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text('Meals & Drinks', style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Poppins-Light',
                                ),),
                              ),
                              TextFormField(
                                controller: _titleController,
                                validator: ((value) {
                                  if(value!.isEmpty){
                                    return 'Please complete required feild';
                                  }
                                  return null;
                                }),
                                decoration: InputDecoration(
                                  fillColor: Colors.grey,
                                  hintText: "Title",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 18,horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(color:  Colors.grey),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: const Color(0xFF7D2AE7),),
                                    gapPadding: 5.w,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color:  Colors.grey),
                                    gapPadding: 5.w,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              InkWell(
                                onTap: (){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context){
                                        return _typeList();
                                      }
                                  );
                                },
                                child: TextFormField(
                                  controller: _typeController,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey,
                                    hintText: "Food Type",
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 18,horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(color:  Colors.grey),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: const Color(0xFF7D2AE7),),
                                      gapPadding: 5.w,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color:  Colors.grey),
                                      gapPadding: 5.w,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    suffixIcon: const Icon(CupertinoIcons.chevron_down, color: Colors.grey, size: 24,),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              InkWell(
                                onTap: (){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context){
                                        return _listView(
                                          fieldValue: 'Area',
                                          list: _areaList,
                                          textController: _areaController,
                                        );
                                      }
                                  );
                                },
                                child: TextFormField(
                                  controller: _areaController,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey,
                                    hintText: "Area",
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 18,horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(color:  Colors.grey),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: const Color(0xFF7D2AE7),),
                                      gapPadding: 5.w,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color:  Colors.grey),
                                      gapPadding: 5.w,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    suffixIcon: const Icon(CupertinoIcons.chevron_down, color: Colors.grey, size: 24,),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              InkWell(
                                onTap: (){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context){
                                        return _listView(
                                            fieldValue: 'Nutrients',
                                          list: _nutrientList,
                                          textController: _nutrientController,
                                        );
                                      }
                                  );
                                },
                                child: TextFormField(
                                  controller: _nutrientController,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey,
                                    hintText: "Nutrients",
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 18,horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(color:  Colors.grey),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: const Color(0xFF7D2AE7),),
                                      gapPadding: 5.w,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color:  Colors.grey),
                                      gapPadding: 5.w,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    suffixIcon: const Icon(CupertinoIcons.chevron_down, color: Colors.grey, size: 24,),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              InkWell(
                                onTap: (){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context){
                                        return _listView(
                                          fieldValue: 'Specialty',
                                          list: _specialtyList,
                                          textController: _dietaryController,
                                        );
                                      }
                                  );
                                },
                                child: TextFormField(
                                  controller: _dietaryController,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey,
                                    hintText: "Dietary Specialty",
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 18,horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(color:  Colors.grey),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: const Color(0xFF7D2AE7),),
                                      gapPadding: 5.w,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color:  Colors.grey),
                                      gapPadding: 5.w,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    suffixIcon: const Icon(CupertinoIcons.chevron_down, color: Colors.grey, size: 24,),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              TextFormField(
                                validator: ((value) {
                                  if(value!.isEmpty){
                                    return 'Please complete required feild';
                                  }
                                  return null;
                                }),
                                controller: _descController,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey,
                                  hintText: "Description",
                                  counterText: "Highlight the key points that best describes your project",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 18,horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(color:  Colors.grey),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: const Color(0xFF7D2AE7),),
                                    gapPadding: 5.w,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color:  Colors.grey),
                                    gapPadding: 5.w,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              TextFormField(
                                validator: ((value) {
                                  if(value!.isEmpty){
                                    return 'Please complete required feild';
                                  }
                                  return null;
                                }),
                                autofocus: false,
                                controller: _priceController,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey,
                                  labelText: "Price ",
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  prefixText: 'GHC',
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 18,horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(color:  Colors.grey),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: const Color(0xFF7D2AE7),),
                                    gapPadding: 5.w,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color:  Colors.grey),
                                    gapPadding: 5.w,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                      child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF7D2AE7).withOpacity(.20),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: _catProvider.urlList.length==0 ? const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(child: Text('No image selected')),
                          ) : GalleryImage(imageUrls: _catProvider.urlList,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {

                                });
                                showDialog(context: context, builder: (BuildContext context){
                                  return const ImagePickerWidget();
                                }
                                );
                              },
                              child: Container(
                                height: 60,
                                width: 250,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF01C3CD),
                                      const Color(0xFF7D2AE7),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    stops: [0.0, 0.8],
                                   ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 25.0),
                                      child: Icon(CupertinoIcons.photo_camera_solid, size: 25,color: Colors.white,),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 30.0),
                                      child: Text(
                                        "Choose Photo",
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
                            const SizedBox(height: 40,),
                            InkWell(
                              onTap: (){
                                validate(_catProvider);
                                print(_catProvider.dataToFireStore);
                                Navigator.pushNamed(context, SellerReviewScreen.id);
                              },
                              child: Container(
                                height: 60,
                                width: 300,
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
                                child: const Center(
                                  child: const Text(
                                    "Publish",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Poppins-Light',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

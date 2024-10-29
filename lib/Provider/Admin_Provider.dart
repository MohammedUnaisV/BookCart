import 'dart:collection';
import 'dart:io';
import 'package:bookcartproject1/Model/Model_class.dart';
import 'package:bookcartproject1/Screens/Admin/Admin_Home_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/myfunctions.dart';
import '../Screens/Users/BottomNavigation.dart';
class AdminProvider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  firebase_storage.Reference ref = FirebaseStorage.instance.ref("IMAGEURL");


  TextEditingController categorynameController = TextEditingController();
  TextEditingController titleChangeController = TextEditingController();
  TextEditingController changePriceController = TextEditingController();
  TextEditingController categoryIDController = TextEditingController();
  TextEditingController CaruoselController = TextEditingController();


  File? addProductFileImg;
  String productFileUrl = "";

  AdminProvider() {
    getAddedCategory();
    notifyListeners();
  }

  Future cagetImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future cagetImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      addProductFileImg = File(croppedFile.path);
      notifyListeners();
    }
  }

  Future<void> addCategory() async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> productDetails = HashMap();
    productDetails["CATEGORY_NAME"] = categorynameController.text;
    productDetails["CATEGORY_ID"] = id;

    if (categorynameController.text.isEmpty) {
      print('Category name cannot be empty');
      return;
    }

    if (addProductFileImg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      final ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(addProductFileImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          productDetails["PHOTO"] = value;
          notifyListeners();
        }
        );
      }
      );
    }

    // Ensure Firestore update completes
    await db.collection("CATEGORY").doc(id).set(productDetails);
    notifyListeners();
  }


  // ....................................getCategory..................


  List<GetCategory>CategoryList = [];

  void getAddedCategory() {
    print('fdddd');
    notifyListeners();
    db.collection("CATEGORY").get().then((value) {
      print('ddddd');
      notifyListeners();
      if (value.docs.isNotEmpty) {
        notifyListeners();
        CategoryList.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic>map = element.data();
          CategoryList.add(GetCategory(
            element.id,
            map["CATEGORY_NAME"].toString() ?? "",
            map["PHOTO"].toString() ?? "",

          )
          );
        }
        print("category list length ${CategoryList.length}");
        notifyListeners();
      }
    }
    );
    notifyListeners();
  }


// .............................Category Delete.........................

  void deleteCategory(String id){
    db.collection("CATEGORY").doc(id).delete();
    getAddedCategory();
    notifyListeners();

  }

//   ............................

// ...............................add Books...................

File? addProduct;
String addproductUrl = "";



Future addBookImageGallery() async {
  final imagePicker = ImagePicker();
  final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    cropProductImage(pickedImage.path, "");
  } else {
    print('No image selected.');
  }
}

Future addgetImgCamera() async {
  final imgPicker = ImagePicker();
  final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

  if (pickedImage != null) {
    cropProductImage(pickedImage.path, "");
  } else {
    print('No image selected.');
  }
}

Future<void> cropProductImage(String path, String from) async {
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: path,
    aspectRatioPresets: Platform.isAndroid
        ? [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9,
    ]
        : [
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio5x3,
      CropAspectRatioPreset.ratio5x4,
      CropAspectRatioPreset.ratio7x5,
      CropAspectRatioPreset.ratio16x9,
    ],
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.white,
          toolbarWidgetColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Cropper',
      ),
    ],
  );
  if (croppedFile != null) {
    addProduct = File(croppedFile.path);
    notifyListeners();
  }
}

Future<void> addProdects() async {
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  HashMap<String, Object> productDetails = HashMap();
  productDetails["PRODECT_TITEL"] = titleChangeController.text;
  productDetails["PRODECT_PRICE"] = changePriceController.text;
  productDetails["CATEGORY_NAME"] = categorynameController.text;
  productDetails["CATEGORY_ID"] =id;

  if (addProduct != null) {
    String photoId = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = FirebaseStorage.instance.ref().child(photoId);
    await ref.putFile(addProduct!).whenComplete(() async {
      await ref.getDownloadURL().then((value) {
        productDetails["PHOTO"] = value;
        notifyListeners();
      }
      );
    }
    );
  }

  // Ensure Firestore update completes
  await db.collection("PRODECTS").doc(id).set(productDetails);
  GetProdect();
  notifyListeners();


}



  // ...............get product.............


  List<GetProdectDtls>ProdectAddList = [];

  void GetProdect() {
    db.collection("PRODECTS").get().then((value) {

      if (value.docs.isNotEmpty) {

        ProdectAddList.clear();
        for (var element in value.docs) {
          Map<String, dynamic> map = element.data();
          ProdectAddList.add(GetProdectDtls(
            element.id,
            map["PRODECT_TITEL"]?.toString() ?? "",
            map["PHOTO"]?.toString() ?? "",
            map["PRODECT_PRICE"]?.toString() ?? "",
            map["CATEGORY_NAME"]?.toString() ?? "",
            map["CATEGORY_ID"]?.toString() ?? "",
            map["PRODUCT_COUNT"]?.toString() ?? "",
            map["TOTAL_PRICE"]?.toString() ?? "",

          ));
        }
        notifyListeners();
      }
      notifyListeners();
    }
    );
  }


//   ..............prodect delete.........


  void deleteProdect(String id){
    db.collection("PRODECTS").doc(id).delete();
    GetProdect();
    notifyListeners();

  }






//   ........................Caruosel Add...............


  File? addCaruosel;
  String addCaruoselUrl = "";

// Function to pick an image from the gallery
  Future addCaruoselGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropCaruoselImage(pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

// Function to crop the image
  Future<void> cropCaruoselImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    if (croppedFile != null) {
      addCaruosel = File(croppedFile.path);
      notifyListeners();
    }
  }

  // Function to upload the image to Firebase Storage and Firestore
  Future<void> addCaruosels() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> productDetails = HashMap();

    if (addCaruosel != null) {

        String photoId = DateTime.now().millisecondsSinceEpoch.toString();
        final ref = FirebaseStorage.instance.ref().child(photoId);

        // Upload the image
        await ref.putFile(addCaruosel!).whenComplete(() async {
          // Get the download URL
          await ref.getDownloadURL().then((value) {
            productDetails["PHOTO"] = value;
          });
        });

        // Ensure Firestore update completes after adding the image URL
        await FirebaseFirestore.instance.collection("CARUOSEL").doc(id).set(productDetails).then((_) {
        }).catchError((error) {
          print("Failed to add details to Firestore: $error");
        });
        GetCarousel();
        notifyListeners();
      }
    }



  //    ................getCaruosel................

  List<GetCaruoselDtls> CarouselGetList = [];

  void GetCarousel() {
    db.collection("CARUOSEL").get().then((value) {
      if (value.docs.isNotEmpty) {
        CarouselGetList.clear();
        for (var element in value.docs) {
          Map<String, dynamic> map = element.data();
          CarouselGetList.add(GetCaruoselDtls(
            element.id,
            map["PHOTO"]?.toString() ?? "",
          )
          );
        }
        notifyListeners();
      }
      notifyListeners();
    });
  }


  //..........deleetCaruosel............



  void deleteCaruosel(String id){
    db.collection("CARUOSEL").doc(id).delete();
    GetCarousel();
    notifyListeners();

  }


//   ........................... filter prodect list............


  // List<GetCategory> filteredProductsList =[];
  //
  // void filteredSelectedCategory(String categoryName) {
  //   // Filter the products based on the selected category
  //   filteredProductsList = ProdectAddList.where((product) => product.categoryName == categoryName).toList();
  //   notifyListeners();
  // }



// ..................Admin log ....................



  String verificationId = '';
  TextEditingController AdminregphoneController = TextEditingController();
  TextEditingController AdminregpasswordController = TextEditingController();
  TextEditingController AdminnameController = TextEditingController();
  TextEditingController AdminAddressController = TextEditingController();



  final formKey = GlobalKey<FormState>();

  // Adds the user's details to Firestore and SharedPreferences
  Future<void> addAdminDetails(BuildContext context) async {



    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, dynamic> aMap = HashMap();
    aMap["PHONE_NUMBER"] = AdminregphoneController.text;
    aMap["PASSWORD"] = AdminregpasswordController.text;
    aMap["NAME"] = AdminnameController.text;
    aMap["REGISTER_ID"] = id;
    aMap["ADDRESS"] = AdminAddressController.text;

    await db.collection("ADMIN").doc(id).set(aMap, SetOptions(merge: true));

// Save user data in SharedPreferences


  }


// ------------------------------------------------------------------------------


  String loginPhoneNumber = "";
  String loginName = "";
  String loginPassword = "";
  String loginUserId = "";
  String loginAddress = "";
  Future<void> usersAuthorized(String? lgphoneNumber, String? lgpassword, BuildContext context) async {
    try {
      print("Starting login process for phone number: $lgphoneNumber");

      // Query Firestore to check if the user exists with the provided phone number and password
      QuerySnapshot snapshot = await db.collection("ADMIN")
          .where("PHONE_NUMBER", isEqualTo: lgphoneNumber)
          .where("PASSWORD", isEqualTo: lgpassword)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // User found, proceed with login
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("PhoneNumber", lgphoneNumber!);
        await prefs.setString("Password", lgpassword!);

        Map<String, dynamic> map = snapshot.docs.first.data() as Map<String, dynamic>;
        loginUserId = map["REGISTER_ID"] ?? "";
        loginPhoneNumber = map["PHONE_NUMBER"] ?? "";
        loginName = map["NAME"] ?? "";
        loginPassword = map["PASSWORD"] ?? "";
        loginAddress = map["ADDRESS"] ?? "";

         getAddedCategory();
         GetProdect();
         GetCarousel();

        // Navigate to the next page after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>Admin_Homepage(userid: '',),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "User not found or invalid credentials",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFFEF9A9A),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "An error occurred. Please try again.",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFFEF9A9A),
        ),
      );
    }
  }


  void EditCategory(String id) {
    db.collection("doner").doc(id).get().then((value) {
      Map<dynamic,dynamic> map=value.data()as Map;
      if(value.exists){
        nameController.text=map["NAME"].toString();
        numberController.text=map["NUMBER"].toString();
        locationController.text=map["LOCATION"].toString();
        notifyListeners();
      }
    }

    );
    notifyListeners();
  }


}











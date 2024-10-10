import 'dart:collection';
import 'dart:io';

import 'package:bookcartproject1/Model/Model_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminProvider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  firebase_storage.Reference ref = FirebaseStorage.instance.ref("IMAGEURL");


  TextEditingController categorynameController = TextEditingController();
  TextEditingController titleChangeController = TextEditingController();
  TextEditingController changePriceController = TextEditingController();


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
  productDetails["Prodects_NAME"] = titleChangeController.text;
  productDetails["Prodects_PRICE"] = changePriceController.text;
  productDetails["CATEGORY_NAME"] = categorynameController.text;


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


}
}
// .................Get......................






// ..................................................................................



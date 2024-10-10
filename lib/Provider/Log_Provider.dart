import 'dart:collection';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LogProvider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  String verificationId = '';
  TextEditingController regphoneController = TextEditingController();
  TextEditingController regpasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // Adds the user's details to Firestore and SharedPreferences
  Future<void> addDetails() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, dynamic> aMap = HashMap();
    aMap["PHONE_NUMBER"] = regphoneController.text;
    aMap["PASSWORD"] = regpasswordController.text;
    aMap["NAME"] = nameController.text;

    await db.collection("REGISTER_DETAILS").doc(id).set(
        aMap, SetOptions(merge: true));
// ........................
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("PHONE", phoneController.text);
    await prefs.setString("PASSWORD", passwordController.text);
    notifyListeners();
  }

  // Retrieves the saved login details from SharedPreferences
  Future<void> regDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phoneController.text = prefs.getString("PHONE") ?? "";
    passwordController.text = prefs.getString("PASSWORD") ?? "";
    notifyListeners();
  }


  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> logDetails() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, dynamic> Map1 = HashMap();
    Map1["PHONE_NUMBER"] = phoneController.text;
    Map1["PASSWORD"] = passwordController.text;

    // await db.collection("LOG_IN_DETAILS").doc(id).set(Map1, SetOptions(merge: true));
  }


  TextEditingController editNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  // ...................profile add image.............................................


  Future<void> UserImageAdd(ImageSource source) async {
    final userImageadd = ImagePicker();
    final userPickedImage = await userImageadd.pickImage(source: source);

    if (userPickedImage != null) {
      await userImagecrop(userPickedImage.path);
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  Future<void> userImagecrop(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.white,
          toolbarWidgetColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Cropper'),
      ],
    );

    if (croppedFile != null) {
      addUserProfilePick = File(croppedFile.path);
      notifyListeners();
    }
  }

  String userProfileUrl = "";
  File? addUserProfilePick;





  void userAddProfile() async {
    try {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      Map<String, dynamic> userProfilePick = {
        "USER_IMAGE": userProfileUrl,
      };

      // Check if there is an image file to upload
      if (addUserProfilePick != null) {
        // Check for addUserProfilePick
        String photoId = DateTime.now().millisecondsSinceEpoch.toString();
        Reference ref = FirebaseStorage.instance.ref().child(photoId);

        // Upload the image file to Firebase Storage
        await ref.putFile(addUserProfilePick!).whenComplete(() async {
          String downloadUrl = await ref.getDownloadURL();
          userProfilePick["USER_IMAGE"] = downloadUrl;

          // Save the user profile in Firestore
          await db.collection("USER_PROFILE_PICK").doc(id).set(userProfilePick);
          notifyListeners();
        });
      } else {
        // If no image is provided, save the user profile without the image
        notifyListeners();
      }
    } catch (e) {
      print("Failed to upload profile image: $e");
    }


    // Method to handle image picking
    Future<void> UserImageAdd(ImageSource source) async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);

      if (image != null) {
        addUserProfilePick = File(image.path);
        notifyListeners();
      }
    }
  }

//   ...............................................................end.............



}


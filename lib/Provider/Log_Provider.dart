import 'dart:collection';
import 'dart:core';
import 'package:bookcartproject1/Provider/Admin_Provider.dart';
import 'package:bookcartproject1/Screens/Users/logPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants/myfunctions.dart';
import '../Screens/Users/BottomNavigation.dart';



class LogProvider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  String verificationId = '';
  TextEditingController regphoneController = TextEditingController();
  TextEditingController regpasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController AddressController = TextEditingController();



  final formKey = GlobalKey<FormState>();

  // Adds the user's details to Firestore and SharedPreferences
  Future<void> addDetails(BuildContext context) async {



    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, dynamic> aMap = HashMap();
    aMap["PHONE_NUMBER"] = regphoneController.text;
    aMap["PASSWORD"] = regpasswordController.text;
    aMap["NAME"] = nameController.text;
    aMap["REGISTER_ID"] = id;
    aMap["ADDRESS"] = AddressController.text;

    await db.collection("USERS").doc(id).set(aMap, SetOptions(merge: true));

// Save user data in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("NAME", nameController.text);
    await prefs.setString("PHONE_NUMBER", regphoneController.text);
    await prefs.setString("PASSWORD", regpasswordController.text);

    usersAuthorized(regphoneController.text, regpasswordController.text, context);


  }


// ------------------------------------------------------------------------------


  String loginPhoneNumber = "";
  String loginName = "";
  String loginPassword = "";
  String loginUserId = "";
  String loginAddress = "";
  Future<void> usersAuthorized(String? lgphoneNumber, String? lgpassword, BuildContext context) async {
    AdminProvider AdminPro = Provider.of<AdminProvider>(context, listen: false);

    try {
      print("Starting login process for phone number: $lgphoneNumber");

      // Query Firestore to check if the user exists with the provided phone number and password
      QuerySnapshot snapshot = await db.collection("USERS")
          .where("PHONE_NUMBER", isEqualTo: lgphoneNumber)
          .where("PASSWORD", isEqualTo: lgpassword)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // User found, proceed with login
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("PhoneNumber", lgphoneNumber!);
        prefs.setString("Password", lgpassword!);

        // Extract user details from the snapshot
        Map<String, dynamic> map = snapshot.docs.first.data() as Map<String, dynamic>;
        loginUserId = map["REGISTER_ID"] ?? "";
        loginPhoneNumber = map["PHONE_NUMBER"] ?? "";
        loginName = map["NAME"] ?? "";
        loginPassword = map["PASSWORD"] ?? "";
        loginAddress = map["ADDRESS"] ?? "";

        // Fetch necessary data
        AdminPro.getAddedCategory();
        AdminPro.GetProdect();
        AdminPro.GetCarousel();

        // Notify listeners to update UI if needed
        notifyListeners();
        callNext(context, BottomNavigation(userId: loginUserId,));
        // Return true if login was successful
        // return true;
      } else {
        // User not found, display a snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "User not found or invalid credentials",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFFEF9A9A),
          ),
        );

        // Return false if login failed
        // return false;
      }
    } catch (error) {
      // Handle any potential errors during the process
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "An error occurred. Please try again.",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFFEF9A9A),
        ),
      );

      // Return false in case of an error
      // return false;
    }
  }




  logOutAlert(BuildContext context, ) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    AlertDialog alert =AlertDialog(
      backgroundColor: Colors.white,
      scrollable: true,
      title: const Text(
        "Do you want to Logout",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: TextButton(
                    child: const Text('No', style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      finish(context);
                      // finish(context);
                    }),
              ),
              Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.black12),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: TextButton(
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LogPage()), (Route<dynamic> route) => false);

                    }),
              ),
            ],
          ),
        ],
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }







}


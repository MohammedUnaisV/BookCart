





import 'dart:io';

import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Provider/Log_Provider.dart';
import 'package:bookcartproject1/Screens/Users/Account.dart';
import 'package:bookcartproject1/Screens/Users/HomePage.dart';
import 'package:bookcartproject1/Screens/Users/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditAccount extends StatelessWidget {
  EditAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: maincolor,
          title: Text(
            "Edit Account",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "allerta",
              fontSize: 17,
            ),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
        ),
        backgroundColor: subcolor,
        body: Consumer<LogProvider>(
          builder: (context, edit, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 50),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.grey[300], // Light grey background
                      backgroundImage: edit.addUserProfilePick != null
                          ? FileImage(edit.addUserProfilePick!)
                          : AssetImage('assets/images/user null.png') as ImageProvider, // Use a local asset as default
                    ),
                  ),
                  TextButton(
                    onPressed: () => _showBottomSheet(context, edit),
                    child: Text(
                      "Edit Photo",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "abeze",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: edit.nameController,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        hintText: "Name",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "abeze",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: edit.mobileController,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        hintText: "Mobile Number",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "abeze",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: edit.addressController,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        hintText: "Edit Address",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "abeze",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: maincolor,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => account()));
                      },
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          height: 65,
          width: 350,
          color: maincolor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 70, top: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  child: Column(
                    children: [
                      Icon(Icons.home, color: Colors.white),
                      Text(
                        "Home",
                        style: TextStyle(color: Colors.white, fontFamily: "allerta"),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => cart()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 80, top: 10),
                  child: Column(
                    children: [
                      Icon(Icons.shopping_cart_outlined, color: Colors.white),
                      Text(
                        "Cart",
                        style: TextStyle(color: Colors.white, fontFamily: "allerta"),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => account()));
                  },
                  child: Column(
                    children: [
                      Icon(Icons.supervisor_account_rounded, color: Colors.blue),
                      Text(
                        "Account",
                        style: TextStyle(color: Colors.blue, fontFamily: "allerta"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }




  void _showBottomSheet(BuildContext context, LogProvider edit) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Take Photo"),
                onTap: () async {
                  Navigator.pop(context);
                  print("Taking photo");
                  await edit.UserImageAdd(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Choose from Gallery"),
                onTap: () async {
                  Navigator.pop(context);
                  print("Choosing from gallery");
                  await edit.UserImageAdd(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

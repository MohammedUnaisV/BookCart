import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Provider/Log_Provider.dart';
import 'package:bookcartproject1/Screens/Users/HomePage.dart';
import 'package:bookcartproject1/Screens/Users/cart.dart';
import 'package:bookcartproject1/Screens/Users/edit%20account.dart';
import 'package:bookcartproject1/Screens/Users/logPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Constants/mycolors.dart';
import '../../Provider/Admin_Provider.dart';

class AddCategory extends StatelessWidget {
  AddCategory({super.key});



  @override


  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child:  Scaffold(
        appBar: AppBar(backgroundColor:maincolor,
          title: Text("Add Category",style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.normal,
              fontFamily: "allerta"
          ),
          ),
          centerTitle:true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20),

              )
          ),
        ),
        backgroundColor: subcolor,

        body: Consumer<AdminProvider>(
            builder: (context,value,child) {
              return SingleChildScrollView(

                child:
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:70,top:50),
                      child: InkWell(onTap: () {
                        showBottomSheet(context);
                      },
                        child: CircleAvatar
                          (
                          radius: 70,
                          backgroundColor: Colors.white,
                          backgroundImage: value.addProductFileImg != null
                              ? FileImage(value.addProductFileImg!)
                              : AssetImage('assets/images/user null.png') as ImageProvider, // Use a loca
                          // backgroundImage:AssetImage("assets/images/img_14.png"),
                        ),
                      ),
                    ),



                    Padding(
                      padding: const EdgeInsets.only(left: 80,top: 20),
                      child: Container(
                        height:height/12,
                        width:width/2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: maincolor
                        ),
                        child:
                        TextField(
                          controller: value.categorynameController,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            hintText: "Add Category",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontFamily: "abeze",
                            ),
                          ),
                        ),

                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 80,top: 20),
                      child:
                      InkWell(onTap: () {
                        value.addCategory();
                        value.getAddedCategory();
                        Navigator.pop(context);
                      },
                        child: Container(
                          height:height/15,
                          width:width/2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: maincolor
                          ),
                          child: Center(
                            child: Text("save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "abeze"
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              );
            }
        ),
      ),
    );

  }


  void showBottomSheet(BuildContext context) {
    AdminProvider mainProvider = Provider.of<AdminProvider>(context, listen: false);
    showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.camera_enhance_sharp,
                color: Colors.blue,
              ),
              title: const Text('Camera'),
              onTap: () {
                mainProvider.cagetImgcamera();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo, color: Colors.blue),
              title: const Text('Gallery'),
              onTap: () {
                mainProvider.cagetImggallery();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

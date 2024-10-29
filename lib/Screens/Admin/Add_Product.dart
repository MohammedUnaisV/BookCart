
import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Provider/Admin_Provider.dart';
import 'package:bookcartproject1/Provider/Log_Provider.dart';
import 'package:bookcartproject1/Screens/Admin/Add_Pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Model/Model_class.dart';

class AddProdect extends StatefulWidget {
  AddProdect({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<AddProdect> createState() => _AddProdectState();
}

class _AddProdectState extends State<AddProdect> {
  String? category;


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: subcolor,
      body: Consumer<AdminProvider>(
          builder: (context, value, child) {
            return SingleChildScrollView(
                child:
                Form(
                  key: widget.formKey,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 60),
                      child: Container(
                        height:height/3.5,
                        width:width/1.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffAFD579),
                            border: Border.all(color: Colors.black26),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 3,
                              )
                            ]
                        ),

                        child: Column(
                          children: [
                            SizedBox(height:height/30,),
                            InkWell(onTap: () {
                              showBottomSheet(context, value);
                            },
                              child: CircleAvatar
                                (
                                radius: 60,
                                backgroundColor: Colors.white,
                                backgroundImage: value.addProduct != null
                                    ? FileImage(value.addProduct!)
                                    : AssetImage('assets/images/user null.png') as ImageProvider,
                              ),
                            ),

                            SizedBox(height:height/40,),
                            Text("Add images",
                              style: TextStyle(
                                color: maincolor,
                                fontSize: 18,
                                fontFamily: "allerta",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 40),
                      child: Container(
                        height:height/12,
                        width:width/1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: maincolor,
                        ),
                        child: TextField(
                          controller: value.titleChangeController,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            hintText: "Title Change",
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "aleo"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Container(
                        height:height/12,
                        width:width/1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: maincolor,
                        ),
                        child: TextField(
                          controller: value.changePriceController,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            hintText: "Change Price",
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "aleo"),
                          ),
                        ),
                      ),
                    ),




                    // ........// select Category...................................................

                    Consumer<AdminProvider>(
                        builder: (context1,val,child) {
                          return Autocomplete<GetCategory>(
                            optionsBuilder: (TextEditingValue textEditingValue) {
                              return value.CategoryList
                                  .where((GetCategory item) => item. categoryName
                                  .toLowerCase()
                                  .contains(textEditingValue.text.toLowerCase()))
                                  .toList();
                            },
                            displayStringForOption: (GetCategory option) =>
                            option.categoryName,
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController fieldTextEditingController,
                                FocusNode fieldFocusNode,
                                VoidCallback onFieldSubmitted) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                fieldTextEditingController.text = val.categorynameController.text;
                              });

                              return Padding(
                                padding: const EdgeInsets.only(left: 8.0,top: 20),
                                child: Container(
                                  height:height/12,
                                  width:width/1.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: maincolor,
                                    // ,
                                  ),

                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width / 1.1,
                                    child: TextFormField(
                                      // cursorColor: Colors.brown,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.w500),
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(10)
                                        ),

                                        hintText: "Select Category",
                                        hintStyle: const TextStyle(

                                            color: Colors.white,
                                            fontSize: 16,
                                            height: 4,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "aleo"
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide.none,

                                        ),
                                      ),
                                      onChanged: (txt) {},
                                      controller: fieldTextEditingController,
                                      focusNode: fieldFocusNode,
                                    ),
                                  ),
                                ),
                              );
                            },
                            onSelected: (GetCategory selection) {
                              value.categorynameController.text = selection.categoryName;
                              // value.productSelectedcategoryid = selection.id;
                            },
                            optionsViewBuilder: (BuildContext context,
                                AutocompleteOnSelected<GetCategory> onSelected,
                                Iterable<GetCategory> options) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Material(
                                  child: Container(

                                    decoration: BoxDecoration(
                                      // color:Color(0xff0C8290),
                                        color: maincolor,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    width:width/1.8,
                                    height:height/4,
                                    child: ListView.builder(
                                      padding: const EdgeInsets.all(10.0),
                                      itemCount: options.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        final GetCategory option = options.elementAt(index);

                                        return GestureDetector(
                                          onTap: () {
                                            onSelected(option);
                                          },
                                          child: Column(
                                            children: [
                                              Container(

                                                decoration: BoxDecoration(

                                                ),

                                                height:height/10,
                                                width:width/1.8,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(option.categoryName,
                                                            style: const TextStyle(
                                                              fontFamily: 'aleo',
                                                              color: Colors.white,
                                                            )
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                              Divider(
                                                thickness: 1,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                    ),


                    // ...................................end....................




                    Padding(
                      padding: const EdgeInsets.only(left: 35, top: 50),
                      child: Row(
                        children: [

                          SizedBox(width:width/4,),
                          Consumer<AdminProvider>(
                            builder: (context,value, child) {
                              return InkWell(onTap: () {
                                value.addProdects();
                                value.GetProdect();
                                Navigator.pop(context);
                              },
                                child: Container(
                                  height:height/18,
                                  width:width/3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: maincolor),
                                  child: Center(
                                      child:
                                      Text(
                                        "Add List",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      )


                                  ),
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                    ),

                  ]
                  ),
                )
            );
          }),
    );
  }
}




void showBottomSheet(BuildContext context, AdminProvider value) {
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
              value.addgetImgCamera();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo, color: Colors.blue),
            title: const Text('Gallery'),
            onTap: () {
              value.addBookImageGallery();
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
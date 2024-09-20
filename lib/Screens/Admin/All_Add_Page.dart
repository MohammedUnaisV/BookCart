import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Provider/Maine_Provider.dart';
import 'package:bookcartproject1/Screens/Admin/Show_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AllAddPage extends StatefulWidget {
  AllAddPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<AllAddPage> createState() => _AllAddPageState();
}

class _AllAddPageState extends State<AllAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: subcolor,
      body: SingleChildScrollView(
        child: Consumer<MaineProvider>(builder: (context, edit1, child) {
          return Form(
            key: widget.formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 60),
                child: Container(
                  height: 250,
                  width: 300,
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
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 80,
                        color: Colors.grey[600],
                      ),
                      TextButton(
                          onPressed: () => _showBottomSheet(context, edit1),
                          child: Text(
                            "Add images",
                            style: TextStyle(
                              color: maincolor,
                              fontSize: 18,
                              fontFamily: "allerta",
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 40),
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: maincolor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 1,
                        )
                      ]),
                  child: TextField(
                    controller: edit1.editTitleController,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                padding: const EdgeInsets.only(left: 35, top: 40),
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: maincolor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 1,
                        )
                      ]),
                  child: TextField(
                    controller: edit1.editPriceController,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      hintText: "Change Price",
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "aleo"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              TextButton(
                  onPressed: () {
                    // var formKey;
                    if (widget.formKey.currentState!.validate()) {
                      edit1.addItp().then((_) {
                          edit1.regDetails();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowPage(),
                              ));
                        },
                      );
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: maincolor),
                    child: Center(
                      child: Text(
                        "Ok",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ))
            ]),
          );
        }),
      ),
    );
  }




  void _showBottomSheet(BuildContext context, MaineProvider edit1) {
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
                  await edit1.UserImageAdd(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Choose from Gallery"),
                onTap: () async {
                  Navigator.pop(context);
                  print("Choosing from gallery");
                  await edit1.UserImageAdd(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

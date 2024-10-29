import 'package:bookcartproject1/Screens/Admin/Add_Carousel_List.dart';
import 'package:bookcartproject1/Screens/Admin/Add_Product.dart';
import 'package:bookcartproject1/Screens/Admin/Prodect_View_List.dart';
import 'package:bookcartproject1/Screens/Admin/addCategory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/Admin_Provider.dart';
import '../../Constants/mycolors.dart';
import 'Carousel_Add.dart';
import 'Category_View_List.dart';

class AddPages extends StatefulWidget {
  const AddPages({Key? key}) : super(key: key);

  @override
  State<AddPages> createState() => _AddPagesState();
}

class _AddPagesState extends State<AddPages> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return SafeArea(
      child: Scaffold(
        backgroundColor: subcolor,
        appBar: AppBar(
          backgroundColor: maincolor,
          title: const Text(
            "Add Pages",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "allerta",
            ),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        ),
        body: Consumer<AdminProvider>(builder: (context, value, child) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryViewList(),
                      ));
                },
                child: Container(
                  height: height/14,
                  width:width/1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: maincolor,
                  ),
                  child: const Center(
                      child: Text(
                    "Add Category",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(height:height/25),
            Consumer<AdminProvider>(
                builder: (context, value, child) {
              return TextButton(
                  onPressed: () {
                    value.GetProdect();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProdectViewList(),
                        )
                    );
                  },
                  child: Container(
                    height:height/14,
                    width:width/1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: maincolor),
                    child: Center(
                      child: Text(
                        "Add Books",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ));
            }),
            SizedBox(height:height/25),
            TextButton(
                onPressed: () {
                  value.GetCarousel();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddCarouselList(),));
                },
                child: Container(
                  height:height/14,
                  width:width/1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: maincolor),
                  child: Center(
                    child: Text(
                      "Add Carousel",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ))
          ]);
        }),
      ),
    );
  }
}

import 'package:bookcartproject1/Screens/Admin/Add_Product.dart';
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
    return SafeArea(child:
    Scaffold(
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
      body: Consumer<AdminProvider>(
        builder: (context, value, child) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => CategoryViewList(),));
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: maincolor,
                      ),
                      child: const Center(child: Text("Add Category",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => AddProdect(),));
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: maincolor
                      ),
                      child: Center(
                        child: Text("Add Books",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                ),



                SizedBox(height: 15),
                TextButton(
                    onPressed: () {
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: maincolor
                      ),
                      child: Center(
                        child: Text("Add Caruosel",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                )





              ]
          );
        }

                ),
              ),


          );


  }


}



























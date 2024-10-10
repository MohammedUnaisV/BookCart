import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Provider/Admin_Provider.dart';
import 'package:bookcartproject1/Screens/Admin/Add_Product.dart';
import 'package:bookcartproject1/Screens/Admin/addCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryViewList extends StatefulWidget {
  const CategoryViewList({super.key});

  @override
  State<CategoryViewList> createState() => _CategoryViewListState();
}

class _CategoryViewListState extends State<CategoryViewList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: subcolor,
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Text(
          "Category List",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: "aleo",
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        )),
      ),
      body: Consumer<AdminProvider>(builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: value.CategoryList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 10,
                      ),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: maincolor,
                        ),
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: 70,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          value.CategoryList[index]
                                              .categoryImage),
                                      fit: BoxFit.fill)
                              ),
                            ),
                          ),
                          title: Row(
                            children: [
                              Text(
                                value.CategoryList[index].categoryName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "philosopher",
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          trailing:InkWell(onTap: () {
                                  value.deleteCategory(
                                  value.CategoryList[index].id
                                  );
                          },
                            child: Icon(Icons.delete_outline_outlined,color: Colors.white,size: 20,)),
                          )
                        ),
                    );
                  }
                  ),
              SizedBox(
                height: 20,
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddCategory(),
                      ),
                    );
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),


        );
      }
    )
    )
    );
  }
}

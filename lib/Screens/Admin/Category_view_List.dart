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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCategory()),
              );
            },
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
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
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Container(
                            height: height / 11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: maincolor,
                            ),
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: height / 11,
                                  width: width / 9,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              value.CategoryList[index].categoryImage),
                                          fit: BoxFit.fill)),
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
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        value.EditCategory(
                                            value.CategoryList[index].CategoryId.toString());
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => AddCategory(

                                              ),
                                            ));
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 20,
                                      ))
                                ],
                              ),
                              trailing: InkWell(
                                  onTap: () {
                                    showDeleteConfirmationDialog(
                                        context, value, value.CategoryList[index].CategoryId.toString());
                                  },
                                  child: Icon(
                                    Icons.delete_outline_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            );
          }),
        ));
  }

  void showDeleteConfirmationDialog(
      BuildContext context, AdminProvider provider, String id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you sure you want to delete?"),
          content: Text("This action cannot be undone."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            Consumer<AdminProvider>(builder: (context, value, child) {
              return ElevatedButton(
                onPressed: () {
                  value.deleteCategory(id);
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("Delete"),
              );
            }),
          ],
        );
      },
    );
  }
}

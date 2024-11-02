import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Constants/mycolors.dart';
import '../../Provider/Admin_Provider.dart';
import 'Add_Product.dart';

class ProdectViewList extends StatefulWidget {
  const ProdectViewList({super.key});

  @override
  State<ProdectViewList> createState() => _ProdectViewListState();
}

class _ProdectViewListState extends State<ProdectViewList> {
  @override
  void initState() {
    super.initState();
    // Fetch product data when the page is initialized
    Provider.of<AdminProvider>(context, listen: false).GetProdect();
  }

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
            "Product List",
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
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProdect()),
            );
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
        body: Consumer<AdminProvider>(builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: value.ProdectAddList.isNotEmpty ?
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: value.ProdectAddList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: height / 10,
                          width: width / 1.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: maincolor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image(image: NetworkImage(value.ProdectAddList[index].ProdectImage)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10, top: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.ProdectAddList[index].ProdectTitel,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            value.ProdectAddList[index].ProdectPrice,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    showDeleteConfirmationDialog(
                                      context,
                                      value,
                                      value.ProdectAddList[index].ProductId,
                                    );
                                  },
                                  child: Icon(
                                    Icons.delete_outline_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                  :SizedBox(
                    height: height/2,
                    child: Center(child: CircularProgressIndicator(color: maincolor,)),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
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
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                provider.deleteProdect(id);
                Navigator.of(context).pop();
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}

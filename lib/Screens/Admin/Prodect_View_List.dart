import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Provider/Admin_Provider.dart';
import 'package:bookcartproject1/Screens/Admin/Add_Pages.dart';
import 'package:bookcartproject1/Screens/Admin/Add_Product.dart';
import 'package:bookcartproject1/Screens/Admin/addCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProdectViewList extends StatefulWidget {
  const ProdectViewList({super.key});

  @override
  State<ProdectViewList> createState() => _ProdectViewListState();
}

class _ProdectViewListState extends State<ProdectViewList> {
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
                "Prodect List",
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
                  )
              ),
            ),


            floatingActionButton: FloatingActionButton(

              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddProdect(),));
            },
              child: Icon(Icons.add),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,

            body: Consumer<AdminProvider>(builder: (context, value, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                      child: SizedBox(height:50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                          itemCount: value.CategoryList.length,
                          itemBuilder: (context,index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical:5,horizontal: 3),
                                child: Container(
                                  height:height/15,
                                  width:width/3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: maincolor,
                                  ),
                                  child: Center(child:
                                  TextButton(onPressed: () {

                                  },
                                    child: Text(value.CategoryList[index].categoryName,style:TextStyle(color: Colors.white),)),
                                  )
                                ),
                              );
                          },
                        ),
                      ),
                    ),
                    

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal:30,vertical: 20),
                    //   child: ListView.builder(
                    //     shrinkWrap: true,
                    //     physics: ScrollPhysics(),
                    //     itemCount: value.ProdectAddList.length,
                    //     itemBuilder: (context,index,) {
                    //       return
                    //         Padding(
                    //           padding: const EdgeInsets.symmetric(vertical: 10),
                    //           child: Container(
                    //             padding: EdgeInsets.symmetric(horizontal: 15),
                    //             height:height/10,
                    //             width:width/1.2,
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 color: maincolor),
                    //             child:Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                   Row(
                    //                     children: [
                    //                       Image(image:NetworkImage(
                    //                         value.ProdectAddList[index].ProdectImage
                    //                       )
                    //                       ),
                    //                       Padding(
                    //                         padding: const EdgeInsets.only(left: 10,top: 10),
                    //                         child: Column(
                    //                           children: [
                    //                             Text(value.ProdectAddList[index].ProdectTitel,
                    //                               style: TextStyle(
                    //                                   fontSize: 15,
                    //                                   color: Colors.white),),
                    //
                    //                             Text(value.ProdectAddList[index].ProdectPrice,
                    //                               style: TextStyle(
                    //                                   fontSize: 15,fontWeight:
                    //                               FontWeight.normal,
                    //                                   color: Colors.white),),
                    //                           ],
                    //                         ),
                    //                       ),
                    //
                    //                     ],
                    //                   ),
                    //                   InkWell(onTap: () {
                    //                     showDeleteConfirmationDialog(context,value,value.ProdectAddList[index].ProductId.toString());
                    //
                    //                   },
                    //                       child: Icon(Icons.delete_outline_rounded,color: Colors.white,))
                    //                 ],
                    //               ),
                    //             )
                    //
                    //                                     ),
                    //         );
                    //
                    //     },
                    //   ),
                    // ),
                  ],
                ),


              );
            }
            )
        )
    );
  }


  void showDeleteConfirmationDialog(BuildContext context, AdminProvider provider, String id) {
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
            Consumer<AdminProvider>(
                builder: (context,value,child) {
                  return ElevatedButton(
                    onPressed: () {
                      value.deleteProdect(id);
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text("Delete"),
                  );
                }
            ),
          ],
        );
      },
    );
  }


}

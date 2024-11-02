import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Provider/Admin_Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Carousel_Add.dart';

class AddCarouselList extends StatefulWidget {
  const AddCarouselList({super.key});

  @override
  State<AddCarouselList> createState() => _AddCarouselListState();
}

class _AddCarouselListState extends State<AddCarouselList> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;



    return SafeArea(child:
    Scaffold(backgroundColor: subcolor,
      appBar: AppBar(
        backgroundColor: maincolor,
        title:
        Text("Caruosel List",
          style: TextStyle(
              fontSize: 20,
              fontWeight:FontWeight.bold,
              fontFamily: "allerta",
              color: Colors.white
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CarouselAdd(),));
        },
        child: Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,

      body:
      Consumer<AdminProvider>(
        builder: (context,value,child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height:height/30,),
            
                ListView.builder(
                  shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: value.CarouselGetList.length,
                    itemBuilder: (context,index) {
            
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Container(
                        height:height/3,
                        decoration: BoxDecoration(image:
                            DecorationImage(image: NetworkImage(value.CarouselGetList[index].photo,),fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child:
                                Padding(
                                  padding: const EdgeInsets.only(left: 200,top: 120),
                                  child: InkWell(onTap: () {
                                    showDeleteConfirmationDialog(context,value,value.CarouselGetList[index].id.toString());


                                  },
                                      child: Icon(Icons.delete_outline_rounded)),
                                )
                      )
                    );
                  }
            
                )
              ],
            ),
          );
        }
      ),


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
                      value.deleteCaruosel(id);
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

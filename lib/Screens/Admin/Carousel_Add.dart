import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Provider/Admin_Provider.dart';
import 'package:bookcartproject1/Screens/Admin/Add_Carousel_List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarouselAdd extends StatefulWidget {
  const CarouselAdd({super.key});

  @override
  State<CarouselAdd> createState() => _CarouselAddState();
}

class _CarouselAddState extends State<CarouselAdd> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(child:
    Scaffold(backgroundColor: subcolor,
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Text("Carousel",
        style: TextStyle(color: Colors.white),),
      ),
      body: Consumer<AdminProvider>(
        builder: (context,value,child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:110,top: 40),
                child: CircleAvatar
                  (
                  radius: 70,
                  backgroundColor: Colors.white,
                  backgroundImage: value.addCaruosel != null
                      ? FileImage(value.addCaruosel!)
                      : AssetImage('assets/images/user null.png') as ImageProvider,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:110),
                child: TextButton(onPressed:() => showBottomSheet(context,value) ,
                    child: Text("Add",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "aleo",
                        fontSize: 20
                      ),
                    )),
              ),

              Padding(
                padding: const EdgeInsets.only(left:100,top: 200),
                child: Container(
                  height:height/19,
                  width:width/4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(12),
                  color: Colors.white
                ),
                  child: TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddCarouselList(),));
                  },
                      child: Consumer<AdminProvider>(
                        builder: (context,value,child) {
                          return InkWell(onTap: () {
                            value.addCaruosels();
                            Navigator.pop(context);
                          },
                              child: Text("Ok"));
                        }
                      )),

                ),
              )
            ],
          );
        }
      ),
    )
    );

  }


  void showBottomSheet(BuildContext context, AdminProvider value) {
    AdminProvider mainProvider = Provider.of<AdminProvider>(
        context, listen: false);
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
              leading: const Icon(Icons.photo, color: Colors.blue),
              title: const Text('Gallery'),
              onTap: () {
                value.addCaruoselGallery();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }


}

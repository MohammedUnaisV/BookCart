import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Constants/myfunctions.dart';
import 'package:bookcartproject1/Provider/Admin_Provider.dart';
import 'package:bookcartproject1/Provider/MaineProvider.dart';
import 'package:bookcartproject1/Screens/Users/HomePage.dart';
import 'package:bookcartproject1/Screens/Users/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/Model_class.dart';

class PlusOneGuide extends StatefulWidget {
  String catergoryTitle;
  String userId;

   PlusOneGuide({
     super.key,
     required this. catergoryTitle,
     required this.userId
   });

  @override
  State<PlusOneGuide> createState() => _PlusOneGuideState();
}

class _PlusOneGuideState extends State<PlusOneGuide> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: maincolor,
        title: Text(widget.catergoryTitle,
          style: TextStyle(
              color: Colors.white,
              fontFamily: "allerta",
              fontSize: 17,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)
            )
        ),
      ),
      backgroundColor: subcolor,
      body: Consumer<AdminProvider>(
        builder: (context,value,child) {
          return SingleChildScrollView(
            child:
            Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height:height/15,
                    width: width/1.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Row(
                      children: [
                        SizedBox(width:width/15),
                        Icon( Icons.search,color: Colors.grey,),
                        Padding(
                          padding: const EdgeInsets.only(left:10),
                          child:
                          Text("Search.....",
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: 16
                            ),
                          ),


                        ),
                      ],
                    ),
                  ),
                ),



                ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount:value.ProdectAddList.length,
                    itemBuilder:  (context, index) {
                      return
                        Padding(
                          padding: const EdgeInsets.only(top: 25,left: 10,right: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal:15),
                            height:height/8,
                            width:width/1.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black26
                            ),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height:height/10,
                                  width:width/6,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      image: DecorationImage(image: NetworkImage(value.ProdectAddList[index].ProdectImage),fit: BoxFit.fill)
                                  ),


                                ),

                                Padding(
                                  padding: const EdgeInsets.only(right:90,top: 15),
                                  child: Column(
                                    children: [
                                      Text(value.ProdectAddList[index].ProdectTitel,
                                        style: TextStyle(color: Colors.black,
                                            fontWeight: FontWeight.normal,fontFamily: "allerta"),
                                      ),
                                      SizedBox(height:height/50,),
                                      Text(value.ProdectAddList[index].ProdectPrice,
                                        style: TextStyle(color: Colors.black,
                                            fontWeight: FontWeight.normal,fontFamily: "allerta"),
                                      ),
                                    ],
                                  ),
                                ),



                                Consumer<AdminProvider>(
                                    builder: (context99, val, child) {
                                    return Consumer<MainProvider>(
                                      builder: (context, value, child) {
                                        return InkWell(
                                          onTap: () {

                                            value.addToCart(
                                                widget.userId, val.ProdectAddList[index].ProductId, val.ProdectAddList[index].ProdectImage,
                                                val.ProdectAddList[index].ProdectPrice, val.ProdectAddList[index].ProdectTitel);
                                            callNext(context, Cart(userId: widget.userId,));
                                          },
                                          child: Container(
                                            height:height/20,
                                            width:width/9,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(6),
                                              color: Colors.black12,
                                              border: Border.all(color: Colors.black26, width:width/40),
                                            ),
                                            child: Icon(Icons.add_shopping_cart_outlined),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                )

                              ],
                            ),



                          ),
                        );

                    }
                ),


              ],
            ),
          );
        }
      ),
    ),
    );
  }
}

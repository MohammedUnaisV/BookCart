


import 'dart:ui';

import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Provider/MaineProvider.dart';
import 'package:bookcartproject1/Screens/Users/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../Constants/myfunctions.dart';
import 'BottomNavigation.dart';
import 'orderSummery.dart';



class Cart extends StatefulWidget {
  final String userId;
  Cart({super.key,
    required this.userId
  });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    MainProvider mprovider =Provider.of<MainProvider>(context,listen: false);


    return Scaffold(
      backgroundColor: subcolor,
      appBar: AppBar(backgroundColor: maincolor,
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
    onPressed: () {
    Navigator.pop(context);
    },
        ),
        title: Text("CART",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "allerta",
            fontSize: 25,
          ),
        ),

        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)
            )
        ),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child:

                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    if(value.cartList.isEmpty){
                      return Center(child:
                      Text("Your cart is empty",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),));
                    }
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount:value.cartList.length ,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {

                            var product=value.cartList[index];
                            String ProductId=product.ProductId;
                            // double unitPrice=double.parse(product.ProdectPrice);
                            double unitPrice = double.tryParse(product.ProdectPrice) ?? 0.0;

                            mprovider.initController(ProductId, unitPrice);


                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: height/6,
                                  width: width,
                                  decoration: BoxDecoration(
                                      color:Colors.black26,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black26),

                                  ),
                                  child:
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SingleChildScrollView(
                                        child: Row(
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.fromLTRB(8,8,8,8),
                                                child: Container(
                                                  height: height/8,
                                                  width: width/5,

                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      image: DecorationImage(
                                                          image: NetworkImage(value.cartList.isNotEmpty?value.cartList[index].ProdectImage:""),

                                                          fit: BoxFit.fill
                                                      )
                                                  ),
                                                )


                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(value.cartList[index].ProdectTitel,style: TextStyle(color:Colors.white,fontSize: 16),),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text("Qty :",style: TextStyle( color:Colors.white,fontSize: 16)),
                                                      IconButton(

                                                        onPressed: () {

                                                          mprovider.decrement(ProductId, unitPrice, widget.userId);
                                                        },
                                                        icon: Icon(Icons.remove),
                                                        color: Colors.white,
                                                      ),
                                                      Container(
                                                        width: width / 16,
                                                        child: TextFormField(
                                                          controller: value.countController[ProductId],
                                                          readOnly: true, // Make it read-only
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          mprovider.increment(ProductId, unitPrice, widget.userId) ;                                                     },
                                                        icon: Icon(Icons.add),
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                  Text("Total: ${value.totalPriceController[ProductId]?.text}",
                                                    style: TextStyle(color:Colors.white,fontSize: 16),),


                                                ],
                                              ),
                                            ),

                                               SizedBox(width:width/10),
                                            IconButton(
                                              onPressed: () {
                                                _showAlertDialog(context, "Delete", widget.userId, ProductId); // Use productId directly
                                              },
                                              icon: Icon(Icons.delete_outline_outlined, color: Colors.black),
                                            )

                                          ],
                                        ),
                                      ),


                                    ],
                                  )

                              ),
                            );
                          },
                        ),
                        SizedBox(height: height/17,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,right: 30),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height:height/14,
                                  width:width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                      color: maincolor
                                  ),
                                  child: Center(child:
                                  Text("Grand Total : ${value.calculateGrandTotal().toStringAsFixed(2)}",style:
                                  TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w500),)),
                                ),
                              ),
                              SizedBox(width:width/20,),
                              Expanded(
                                child: GestureDetector(

                                  onTap: () async {
                                    // Update each product in the CART collection with the latest quantity and total price
                                    for (var product in mprovider.cartList) {
                                      String ProductId = product.ProductId;
                                      int productCount = int.parse(mprovider.countController[ProductId]?.text ?? '1');
                                      double totalPrice = double.parse(mprovider.totalPriceController[ProductId]?.text ?? '0');

                                      // Prepare the updated product data
                                      Map<String, dynamic> updatedProductData = {
                                        "PRODUCT_COUNT": productCount,
                                        "TOTAL_PRICE": totalPrice,
                                      };

                                      // Update the Firestore document for this product
                                      await mprovider.db
                                          .collection("USERS")
                                          .doc(widget.userId)
                                          .collection("CART")
                                          .doc(ProductId)
                                          .update(updatedProductData);
                                    }

                                    // Add grand total to the user's document
                                    mprovider.addGrandTotalToUsers(widget.userId);

                                    // Navigate to the order summary page
                                    callNext(context, ordersummery(userId: widget.userId));
                                  },



                                  // onTap: () {
                                  //
                                  //   mprovider.addGrandTotalToUsers(widget.userId);
                                  //
                                  //   callNext(context, ordersummery(userId: '',));
                                  // },
                                  child: Container(
                                    height:height/14,
                                    width:width,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.circular(8),
                                        color: maincolor
                                    ),
                                    child: Center(child: Text("Place Order",style: TextStyle(
                                        color:Colors.white,fontSize: 16,fontWeight: FontWeight.w500),)),

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                )

        ),
      ),

    );
  }
}


void _showAlertDialog(BuildContext context,String action,String userId,String ProductId){
  showDialog(context: context, builder: (BuildContext context){

    MainProvider deleteProvider=Provider.of<MainProvider>(context,listen: false);
    return AlertDialog(
      title: Text("Confirmation"),
      content: Text("Are you sure want to $action"),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel")
        ),
        TextButton(
            onPressed: () {
              deleteProvider.deleteProductFromCart(userId, ProductId);
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You selected to $action!")),);
            },
            child: Text("Yes")
        )
      ],
    );

  });
  // showBottomSheet(context: context, builder: builder)
}
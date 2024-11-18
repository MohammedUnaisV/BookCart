import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Provider/Log_Provider.dart';
import 'package:bookcartproject1/Provider/MaineProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatefulWidget {
  final int itemIndex; // Add this line to accept index as a parameter

  const OrderDetails({Key? key, required this.itemIndex}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: subcolor,
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Text(
          "Order Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: "allerta",
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
      body: Column(
        children: [
          Consumer<MainProvider>(
            builder: (context, value, child) {
              if (value.cartList.isEmpty) {
                return Center(
                  child: Text(
                    "No items in the cart",
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                );
              }

              final cartItem = value.cartList[widget.itemIndex]; // Access the selected item

              return Padding(
                padding: const EdgeInsets.only(top: 50, left: 30),
                child: Container(
                  height: height / 6,
                  width: width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: subcolor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: width / 20),
                      Container(
                        height: height / 8,
                        width: width / 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black26,
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            image: NetworkImage(cartItem.ProdectImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.ProdectTitel,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "QT: ${value.countController[cartItem.ProductId]?.text}",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Total: ${value.totalPriceController[cartItem.ProductId]?.text ?? "0.00"}",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 30),
            child: Container(
              height:height/6,
              width:width/1.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:subcolor,
                  border: Border.all(color: Colors.black26),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 3),
                  ]
              ),
              child: Column(
                children: [
                  Row(
                      children: [
                        SizedBox(width:width/20),
                        Text("Deliver to:",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "aleo",
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ]
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20,top: 10),
                    child: Consumer<LogProvider>(
                        builder: (context,value,child) {
                          return Text(value.loginAddress,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "aleo",
                                fontSize: 18,
                                fontWeight: FontWeight.normal
                            ),
                          );
                        }
                    ),
                  ),

                ],
              ),
            ),
          ),
// ............................................................................................................
          Padding(
              padding: const EdgeInsets.only(top: 20,left: 30),
              child: Column(
                children: [
                  Container(
                    // height: 300,
                    width:width/1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: subcolor,
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 3,
                              spreadRadius: 1
                          )
                        ]
                    ),
                    child:
                    Stack(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 50,top: 25),
                          child: Container(
                            height: 80,
                            width: 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff007483),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 41,bottom: 20),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xff007483),
                                ),

                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50,top: 20),
                                child: Column(
                                  children: [
                                    Text("Ordered",
                                      style: TextStyle(
                                          color: Color(0xff007483),
                                          fontFamily: "aleo",
                                          fontSize: 18
                                      ),
                                    ),
                                    Text("03 AUG",
                                      style: TextStyle(
                                          color: Colors.black26,
                                          fontFamily: "aleo",
                                          fontSize: 14
                                      ),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),




// ..................................................................................................


                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50,top: 100),
                              child: Container(
                                height: 80,
                                width: 2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff007483),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 41,top: 70),
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xff007483),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50,top: 20),
                                    child: Column(
                                      children: [
                                        Text("Shipped",
                                          style: TextStyle(
                                              color: Color(0xff007483),
                                              fontFamily: "aleo",
                                              fontSize: 18
                                          ),
                                        ),
                                        Text("06 AUG",
                                          style: TextStyle(
                                              color: Colors.black26,
                                              fontFamily: "aleo",
                                              fontSize: 14
                                          ),
                                        ),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),






// .................................................................................................



                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 50,top: 180),
                                  child:
                                  Container(
                                    height: 80,
                                    width: 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff007483),
                                    ),
                                  ),
                                ),

                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:150,left: 41),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Color(0xff007483),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:50,top: 170),
                                      child: Column(
                                        children: [
                                          Text("Out Of Delivery",
                                            style: TextStyle(
                                                color: Color(0xff007483),
                                                fontFamily: "aleo",
                                                fontSize: 16
                                            ),
                                          ),
                                          Text("07 AUG",
                                            style: TextStyle(
                                                color: Colors.black26,
                                                fontFamily: "aleo",
                                                fontSize: 14
                                            ),
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
// .....................................................................................................

                                Padding(
                                  padding: const EdgeInsets.only(left: 41,top: 220),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Color(0xff007483),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left:50,top: 25),
                                            child: Text("Delivery",
                                              style: TextStyle(
                                                  color: Color(0xff007483),
                                                  fontFamily: "aleo",
                                                  fontSize: 18
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 35),
                                            child: Text("08 AUG",
                                              style: TextStyle(
                                                  color: Colors.black26,
                                                  fontFamily: "aleo",
                                                  fontSize: 14
                                              ),
                                            ),
                                          ),

                                        ],
                                      )
                                    ],
                                  ),

                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),



                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}



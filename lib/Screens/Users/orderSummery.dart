import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Constants/myfunctions.dart';
import 'package:bookcartproject1/Provider/Log_Provider.dart';
import 'package:bookcartproject1/Provider/MaineProvider.dart';
import 'package:bookcartproject1/Screens/Users/SuccessPage.dart';
import 'package:bookcartproject1/Screens/Users/error_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class ordersummery extends StatefulWidget {
  ordersummery({super.key});

  @override
  State<ordersummery> createState() => _ordersummeryState();
}

class _ordersummeryState extends State<ordersummery> {
  bool order=false;
  bool order1=false;
  int _value = 1;

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return SafeArea(child:
    Scaffold(backgroundColor: subcolor,
        appBar: AppBar(backgroundColor: maincolor,
          title: Text("Order Summery",
            style:TextStyle(color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 20,
              fontFamily: "allerta",
            ),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)
              )
          ),
        ),
        body: Consumer<MainProvider>(
          builder: (context,value, child) {
            return SingleChildScrollView(
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18,top: 30),
                        child: Container(
                          height:height/6,
                          width:width/1.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: subcolor,
                              border: Border.all(color: Colors.black26),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 1,
                                    blurRadius: 3)
                              ]
                          ),
                          child:
                          Column(
                            children: [
                              SizedBox(height:height/40,),
                              Row(
                                children: [
                                  SizedBox(width:width/20),
                                  Text("Deliver To :",
                                    style: TextStyle(color: Colors.black,
                                        fontFamily:"aleo",
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(width:width/2.5),
                                  Text("Change",
                                    style: TextStyle(color: Colors.black,
                                        fontFamily:"aleo",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                    ),)
                                ],
                              ),
                              SizedBox(height:height/40),
                              Consumer<LogProvider>(
                                builder: (context,value,child) {
                                  return Text(value.loginAddress,
                                    style: TextStyle(color: Colors.black,
                                        fontFamily:"aleo",
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal
                                    ),
                                  );
                                }
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18,top: 30),
                        child: Container(
                          height:height/2.5,
                          width:width/1.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: subcolor,
                              border: Border.all(color: Colors.black26),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 1,
                                    blurRadius: 3)
                              ]
                          ),
                          child:
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Order List",
                                  style: TextStyle(color: Colors.black,
                                      fontFamily:"aleo",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),

                              Container(
                                height:height/6,
                                color: subcolor,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                                  itemCount: value.cartList.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1, // Single row for horizontal scroll
                                    mainAxisSpacing: 9,
                                    crossAxisSpacing: 3,
                                    mainAxisExtent: 310, // Adjusted to control item width in horizontal mode
                                  ),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height:height,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: subcolor,
                                          border: Border.all(color: Colors.black26),
                                          boxShadow: [
                                          BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 1,
                                          blurRadius: 3),
                                          ]
                                      ),
                                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(width:width/20,),
                                          Container(
                                            height:height/8,
                                            width:width/5,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              color: Colors.black26,
                                              border: Border.all(color: Colors.black),
                                              image: DecorationImage(
                                                  image:NetworkImage(value.cartList[index].ProdectImage),fit: BoxFit.fill,

                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20,top: 35),
                                            child: Column(
                                              children: [
                                                Text(value.cartList[index].ProdectTitel,
                                                  style: TextStyle(color:Colors.black54,fontSize: 16,),),

                                                Text("QT: ${value.countController[value.cartList[index].ProductId]?.text}",
                                                  style: TextStyle(color:Colors.black54,fontSize: 16,),),

                                                Text("Total: ${value.totalPriceController[value.cartList[index].ProductId]?.text??"0.00"}",
                                                  style: TextStyle(color:Colors.black54,fontSize: 16,),),

                                              ],
                                            ),
                                          )
                                        ],
                                      ),

                                    );
                                  },
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left:25,top: 60),
                                child: Container(
                                  height:height/600,
                                  width:width/1.3,
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      boxShadow:[BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 1,
                                          blurRadius: 3
                                      ),
                                      ]
                                  ),
                                ),
                              ),
                              Row(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(left:25,top: 10),
                                    child: Text("Total",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily:"aleo",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:10,left: 145),
                                    child: Text("₹ ${value.calculateGrandTotal().toStringAsFixed(2)}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily:"aleo",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 30),
                        child: Container(
                          width:width/1.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:subcolor,
                            boxShadow:[BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 3
                            ),
                            ],
                          ),
                          child:
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right:200,top: 20),
                                child: Text("Payment",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "aleo",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),

                              Row(
                                children: [SizedBox(width:width/9,),
                                  Image.asset("assets/images/upi.png",scale: 4.5,),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right:160,top: 10),
                                        child: Text("UPI",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: [
                                            Text("Pay by any UPI app",
                                              style: TextStyle(
                                                color: Color(0xff3B994C),
                                                fontFamily: "alef",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(width:width/10),
                                                InkWell(onTap: () {
                                                  setState(() {
                                                    order1=!order1;
                                                  });
                                                },
                                                    child:
                                                    Icon(Icons.arrow_drop_down)),



                                          ],
                                        ),
                                      ),

                                    ],
                                  )
                                ],
                              ),
                              Visibility(
                                visible: order1,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Row(
                                        children: [
                                          Text('Google Pay'),
                                          SizedBox(width:width/9),
                                          Image.asset("assets/images/G pay.png",scale:5)
                                        ],
                                      ),
                                      leading: Radio<int>(
                                        value: 1,
                                        groupValue: _value,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: Row(
                                        children: [
                                          Text('PhonePe'),
                                          SizedBox(width:width/6.5),

                                          Image.asset("assets/images/phonepe.png",scale: 5,)
                                        ],
                                      ),
                                      leading: Radio<int>(
                                        value: 2,
                                        groupValue: _value,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: Row(
                                        children: [
                                          Text('Slice'
                                          ),
                                          SizedBox(width:width/4.5),

                                          Image.asset("assets/images/slice.png",scale: 5,)
                                        ],
                                      ),
                                      leading: Radio<int>(
                                        value: 3,
                                        groupValue: _value,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    InkWell(onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => successpage(),));
                                    },
                                      child: Container(
                                        height:height/20,
                                        width:width/4,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                            color: Color(0xffF0DA11)
                                        ),
                                        child:
                                        Center(
                                          child: Text("Pay Now",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal
                                          ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left:10,top: 10),
                                child: Container(
                                  height:height/500,
                                  width:width/1.4,
                                  decoration: BoxDecoration(
                                      color: Colors.black26
                                  ),
                                ),
                              ),
                              SizedBox(height:height/30),


                              Row(
                                children: [SizedBox(width:width/10,),
                                  Icon(Icons.delivery_dining_rounded,size: 25,),
                                  SizedBox(width:width/40),
                                  Text("Cash on Delivery",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "alef",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width:width/6),
                                  InkWell(onTap: () {
                                    setState(() {
                                      order=!order;
                                    });

                                  },
                                      child: Icon(Icons.arrow_drop_down)
                                  )
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left:10,top: 10),
                                child: Container(
                                  height:height/500,
                                  width:width/1.4,
                                  decoration: BoxDecoration(
                                      color: Colors.black26
                                  ),
                                ),
                              ),

                              SizedBox(height:height/20),

                              Visibility(
                                visible: order,
                                child: Column(
                                  children: [
                                    Text("Due to handling costs, a nominal\n        fee of 5  will be charged",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left:10,top: 10),
                                      child: InkWell(onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorPage(),));
                                      },
                                        child: Container(
                                          height:height/15,
                                          width:width/3,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: Color(0xffF0DA11)
                                          ),
                                          child:
                                          Center(
                                            child: Text("Place Order",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                            ],

                          ),

                        ),
                      ),
                      SizedBox(height:height/10,

                      )    ]
                )
            );
          }
        )
    )
    );
  }
}




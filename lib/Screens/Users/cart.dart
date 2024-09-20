import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Screens/Users/Account.dart';
import 'package:bookcartproject1/Screens/Users/HomePage.dart';
import 'package:bookcartproject1/Screens/Users/My_order.dart';
import 'package:bookcartproject1/Screens/Users/orderSummery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cart extends StatelessWidget {
  const cart({super.key});

  @override
  Widget build(BuildContext context) {
    List<String>cart1=[
      "assets/images/img_8.png",
      "assets/images/img_4.png",
      "assets/images/img_11.png"
    ];



    List<String>cart2=[
      " SCERT Q-Bank\n Qty : 1  \n Rs: 240",
      "+1 All in one\n Qty : 1  \n Rs: 240",
      "+1 Economics\n Qty : 1  \n Rs: 240",
    ];


        return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: maincolor,
          title: Text("Cart",style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.normal,
          fontFamily: "allerta"
          ),
          ),
          centerTitle:true,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20),

          )
        ),),
        backgroundColor: subcolor,
       body: SingleChildScrollView(
         child:  Column(
           children: [
             ListView.builder(
                 shrinkWrap: true,
                 physics: ScrollPhysics(),
                 itemCount: 3,
                 itemBuilder:  (context, index) {
                   return Stack(children: [

                     Padding(
              padding: const EdgeInsets.only(left:30,top: 25),
              child: Container(
                height: 80,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: maincolor
                ),
                child:
                Padding(
                  padding: const EdgeInsets.only(left: 80,top: 10),
                  child:
                  Row(
                    children: [
                      Text(cart2[index],
                        style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.normal,fontFamily: "allerta"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:70),
                        child: Image.asset("assets/images/img_12.png", scale: 1.8),
                      )
                    ],
                  ),
                ),



              ),
                     ),
                     Padding(
              padding: const EdgeInsets.only(left: 35,top: 30),
              child: Container(
                height: 70,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  color: Colors.white
                ),
                child: Image.asset(cart1[index],scale: 2.5,),

              ),
                     )
                   ],
                   );
                 }
                 ),
             Row(
               children: [

                 Padding(
                   padding: const EdgeInsets.only(left: 30,top: 150),
                   child: Container(
                     height:50,
                     width: 120,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
                       color: maincolor
                     ),
                       child:
                       Center(
                         child: Text("Total : 1260",
                           style: TextStyle(color: Colors.white,
                               fontFamily: "allerta",
                             fontSize: 15,
                           ),
                         ),
                       )
                   ),
                 ),

                 Padding(
                   padding: const EdgeInsets.only(left: 60,top: 150),
                   child: Container(
                     height:50,
                     width: 120,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
                       color: maincolor
                     ),
                       child:
                       Center(
                         child: InkWell(onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => ordersummery(),));


                         },
                           child: InkWell(onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrder(),));
                           },
                             child: Text("Please order",
                               style: TextStyle(color: Colors.white,
                                   fontFamily: "allerta",
                                 fontSize: 15,
                               ),
                             ),
                           ),
                         ),
                       )
                   ),
                 ),
               ],
             ),

           ],
         ),



















       ),
        bottomNavigationBar: Container(
            height: 65,
            width: 350,
            color: maincolor,

            child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 70,top: 10),
                  child: InkWell(onTap:  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),));
                  },
                    child: Column(
                      children: [
                        Icon(Icons.home,color: Colors.white,),
                        Text("Home",style: TextStyle(
                            color: Colors.white,fontFamily: "allerta"
                        ),),
                      ],
                    ),
                  ),
                ),

                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => cart(),));
                },
                  child: Padding(
                    padding: const EdgeInsets.only(right:80,top: 10),
                    child: Column(
                      children: [
                        Icon(Icons.shopping_cart_outlined,color: Colors.blue,),
                        Text("Cart",style: TextStyle(
                            color: Colors.blue,fontFamily: "allerta"
                        ),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => account(),));
                  },
                    child: Column(
                      children: [
                        Icon(Icons.supervisor_account_rounded,color: Colors.white,),
                        Text("Account",style: TextStyle(
                            color: Colors.white,fontFamily: "allerta"
                        ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            )
        ),
      ),
    );
  }
}














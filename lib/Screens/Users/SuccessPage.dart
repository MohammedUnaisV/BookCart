import 'dart:ui';

import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Screens/Users/HomePage.dart';
import 'package:bookcartproject1/Screens/Users/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class successpage extends StatelessWidget {
  const successpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor: maincolor,
      body: Stack(children: [
        SingleChildScrollView(

          child:
          Column(
            children: [
              Stack(children: [
                Container(
                  height: 410,
                  width: 430,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(220),bottomRight: Radius.circular(220)),
                      color: subcolor

                  ),
                  child:
                  Column(
                    children: [SizedBox(height: 50),
                      Image.asset("assets/images/image 93 (1).png",scale: 2,),

                    ],
                  ),
                ),

              ]

              ),
              SizedBox(height: 60,),
              Text("SUCCESS",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontFamily: "aclonica",

                ),
              ),
              SizedBox(height:20),

              Text("    The payment has been don\n  successfully.Thanks for being \n                 there with us.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "aclonica",

                ),
              ),

              SizedBox(height: 40),

              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(userId: '',),));
              },
                child: Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xff025A20),
                  ),
                  child: Center(
                    child: Text("Done",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: "aclonica",

                      ),),
                  ),

                ),
              )

            ],
          )
          ,


        ),
        Positioned(
          top: 370,
          left: 145,
          child:
          Image.asset("assets/images/Check Mark.png",scale: 4.5,),


        ),


      ],

      ),
    )
    );

  }
}

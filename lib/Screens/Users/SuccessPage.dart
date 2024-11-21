import 'dart:ui';

import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Screens/Users/HomePage.dart';
import 'package:bookcartproject1/Screens/Users/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class successpage extends StatelessWidget {
  const successpage({super.key});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
                  height:height/1.8,
                  width:width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(220),bottomRight: Radius.circular(220)),
                      color: subcolor

                  ),
                  child:
                  Column(
                    children: [
                     Lottie.asset("assets/Lottie/Animation - 1732084330120.json",
                       width:width/2,
                       height:height/2.5,
                     ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [Colors.green.shade900,Colors.green.shade700, Colors.green.shade900,Colors.green.shade700,Colors.green.shade900,Colors.green,],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: Text(
            "SUCCESS",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "aclonica"
            ),
          ),
        ),




                    ],
                  ),
                ),

              ]

              ),

              Lottie.asset("assets/Lottie/Animation - 1732083516605.json",
                width:width/1.2,
                height:height/5,
              ),

              Text("    The payment has been don\n  successfully.Thanks for being \n                 there with us.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "aclonica",

                ),
              ),

              SizedBox(height:height/50),

              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(userId: '',),));
              },
                child: Container(
                  height:height/20,
                  width:width/5,
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


      ],

      ),
    )
    );

  }
}

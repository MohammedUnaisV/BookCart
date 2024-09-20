import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Screens/Users/ref%20page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

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
                    children: [SizedBox(height: 70),
                      Image.asset("assets/images/2222.png",scale: 4.5,),

                    ],
                  ),
                ),

              ]

              ),
              SizedBox(height: 60,),
              Text("ERROR",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontFamily: "aclonica",

                ),
              ),
              SizedBox(height:20),

              Text("Hey,seems like there was some\n    trouble. We are there with \n           you.Just hold back!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "aclonica",

                ),
              ),

              SizedBox(height: 40),

              Container(
                height: 45,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text("Try Again",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: "aclonica",

                    ),),
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
          Image.asset("assets/images/Cancel (1).png",scale: 4.8,),


        ),


      ],

      ),
    )
    );

  }
}

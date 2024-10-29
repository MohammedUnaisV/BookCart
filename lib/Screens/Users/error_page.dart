import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Screens/Users/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'HomePage.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

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
                  width:width/1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(220),bottomRight: Radius.circular(220)),
                      color: subcolor

                  ),
                  child:
                  Column(
                    children: [SizedBox(height:height/10),
                      Image.asset("assets/images/2222.png",scale: 4.5,),

                    ],
                  ),
                ),

              ]

              ),
              SizedBox(height:height/10,),
              Text("ERROR",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontFamily: "aclonica",

                ),
              ),
              SizedBox(height:height/60),

              Text("Hey,seems like there was some\n    trouble. We are there with \n           you.Just hold back!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "aclonica",

                ),
              ),

              SizedBox(height:height/40),
              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(userid: '',),));
              },

                child: Container(
                  height:height/15,
                  width:width/3,
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

                ),
              )

            ],
          )
          ,


        ),
        Positioned(
          top: 360,
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

import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Screens/Users/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

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
                    children: [SizedBox(height:height/20),
                      Lottie.asset("assets/Lottie/Animation - 1732088485978.json",
                        width:300,
                        height: 250,
                      ),

                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [Colors.red.shade700,Colors.red.shade900,Colors.green.shade900,Colors.green.shade900,],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: Text(
                          "ERROR",
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

              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Lottie.asset("assets/Lottie/Animation - 1732092357345.json",
                  width:width/1.5,
                  height:height/6,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(userId: '',),));
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


      ],

      ),
    )
    );

  }
}

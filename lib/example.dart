import 'package:bookcartproject1/Constants/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 200,
                  decoration: BoxDecoration(
                      color: Colors.yellow,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5), // Shadow color with opacity
                          spreadRadius: 5,  // Spread of the shadow
                          blurRadius: 10,   // Blurring of the shadow
                          offset: Offset(5, 5), // Horizontal and Vertical shadow offset
                        ),
                      ]
                  ),


              ),
              Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5), // Shadow color with opacity
                          spreadRadius: 5,  // Spread of the shadow
                          blurRadius: 10,   // Blurring of the shadow
                          offset: Offset(5, 5), // Horizontal and Vertical shadow offset
                        ),
                      ],

                  ),

              ),
              Container(
                  height: 200,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5), // Shadow color with opacity
                          spreadRadius: 5,  // Spread of the shadow
                          blurRadius: 10,   // Blurring of the shadow
                          offset: Offset(5, 5), // Horizontal and Vertical shadow offset
                        ),
                      ]
                  ),

              )
            ],
          ),
          SizedBox(height: 20,),
          ContainerWidget(50,100,Colors.red),
          ContainerWidget(150,100,Colors.cyan),
          ContainerWidget(150,100,Colors.cyan),
        ],
      ),
    );
  }
}

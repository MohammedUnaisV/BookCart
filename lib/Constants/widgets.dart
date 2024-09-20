import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ContainerWidget(double height, double width, Color color){
  return Container(
    height: height,
    width: width,

    decoration: BoxDecoration(
        color: color,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5), // Shadow color with opacity
          spreadRadius: 5,  // Spread of the shadow
          blurRadius: 10,   // Blurring of the shadow
          offset: Offset(5, 5), // Horizontal and Vertical shadow offset
        ),
      ]
    ),
  );
}
import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Screens/Users/OrderDetailes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {


  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {

    List<String> order=[
      "assets/images/mn 4.png",
    ];
    List<String> order1=[
      "Coops",
    ];
    List<String> order2=[
      "1250",
    ];

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: subcolor,
        appBar: AppBar(
          backgroundColor: maincolor,
          title: Center(
            child: Text(
              "My Order",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: "allerta"),
            ),
          ),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 5,top: 20),
            child: Container(
              height:height/16,
              width:width/1.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width:width/250,
                ),
              ),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  hintText: "Search.....",
                  hintStyle: TextStyle(
                    color: Colors.black26,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),

          ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount:order.length,
              itemBuilder:  (context, index) {
                return
                  Padding(
                    padding: const EdgeInsets.only(top: 25,left: 10,right: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal:15),
                      height:height/8,
                      width: width/1.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black26
                      ),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height:height/10,
                            width:width/7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                image: DecorationImage(image:
                                NetworkImage(order[index],)
                            ),


                          ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right:90,top: 15),
                            child: Column(
                              children: [
                                Text(order1[index],
                                  style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.normal,fontFamily: "allerta"),
                                ),
                                SizedBox(height:height/60,),
                                Text(order2[index],
                                  style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.normal,fontFamily: "allerta"),
                                ),
                              ],
                            ),
                          ),

                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => OrederDetails(),));

                            },
                          )


                        ],
                      ),



                    ),
                  );

              }
          ),

        ]
        )
    );
  }
}

import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class plusoneguid extends StatelessWidget {
  const plusoneguid({super.key});

  @override
  Widget build(BuildContext context) {
    List<String>textimg1=[
      "assets/images/guide 1.png",
      "assets/images/guide 2.png",
      "assets/images/guide 3.png",
      "assets/images/guide 4.png",
      "assets/images/guide 5.png",
      "assets/images/guide 6.png",
      "assets/images/guide 7.png",
      "assets/images/guide 8.png",
      "assets/images/guide 9.png",
      "assets/images/guide 10.png",
      "assets/images/guide 11.png",


    ];


    List<String> texttx1 =[
      "Plus one History \nQty : 1 \nRs: 210",
      "Plus One Sociology \nQty : 1  \nRs: 220",
      "Plus one Psychology \nQty : 1  \nRs: 195",
      "Plus one Economics  \nQty : 1  \nRs: 175",
      "Plus one Politics  \nQty : 1  \nRs:  190",
      "Plus one Accountancy  \nQty : 1  \nRs: 220",
      "Plus One business  \nQty : 1   \nRs: 195",
      "Plus One Physics 1  \nQty : 1  \nRs: 170",
      "Plus one Chemistry 1 \nQty : 1 \nRs: 180",
      "Plus One Biology \nQty : 1  \nRs: 230",
      "Plus One Maths \nQty : 1  \nRs: 220",


    ];






    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: maincolor,
        title: Text("+1 Guide",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "allerta",
              fontSize: 17
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)
            )
        ),
      ),
      backgroundColor: subcolor,
      body: SingleChildScrollView(
        child:
        Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 45,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    Icon( Icons.search,color: Colors.grey,),
                    Padding(
                      padding: const EdgeInsets.only(left:10),
                      child:
                      Text("Search.....",
                        style: TextStyle(
                            color: Colors.black26,
                            fontSize: 16
                        ),
                      ),


                    ),
                  ],
                ),
              ),
            ),



            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 11,
                itemBuilder:  (context, index) {
                  return
                    Padding(
                      padding: const EdgeInsets.only(top: 25,left: 10,right: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal:15),
                        height: 80,
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black26
                        ),
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 70,
                              width: 65,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  image: DecorationImage(image: AssetImage(textimg1[index]))
                              ),


                            ),

                            Padding(
                              padding: const EdgeInsets.only(right:30),
                              child: Text(texttx1[index],
                                style: TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.normal,fontFamily: "allerta"),
                              ),
                            ),

                            Icon(Icons.add_shopping_cart_outlined)

                          ],
                        ),



                      ),
                    );

                }
            ),


          ],
        ),
      ),
    ),
    );
  }
}
import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Provider/Log_Provider.dart';
import 'package:bookcartproject1/Provider/MaineProvider.dart';
import 'package:bookcartproject1/Screens/Users/HomePage.dart';
import 'package:bookcartproject1/Screens/Users/cart.dart';
import 'package:bookcartproject1/Screens/Users/edit%20account.dart';
import 'package:bookcartproject1/Screens/Users/logPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class account extends StatelessWidget {
   account({super.key});



  @override


   Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child:  Scaffold(
        appBar: AppBar(backgroundColor:maincolor,
        title: Text("Account",style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.normal,
            fontFamily: "allerta"
        ),
        ),
        centerTitle:true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20),

            )
        ),
        ),
        backgroundColor: subcolor,

        body: Consumer<MainProvider>(
          builder: (context,edit1,child) {
            return SingleChildScrollView(

             child:
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:70,top:50),
                    child: CircleAvatar
                      (
                      radius: 70,
                      backgroundColor: Colors.white,
                      backgroundImage: edit1.addUserProfilePick != null
                          ? FileImage(edit1.addUserProfilePick!)
                          : AssetImage('assets/images/user null.png') as ImageProvider, // Use a loca
                    ),
                  ),

                  Consumer<LogProvider>(
                    builder: (context,log,child) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 90),
                        child: Column(
                          children: [
                            Text(log.loginName,
                              style:TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                  fontFamily: "abeze",
                                color: Colors.black,
                              )
                              ,),



                            Text(log.loginPhoneNumber,
                              style:TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "abeze",
                                color: Colors.black,
                              )
                              ,),



                            Text(log.loginAddress,
                              style:TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "abeze",
                                  color: Colors.black,

                              )
                              ,),
                          ],
                        ),
                      );
                    }
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 80,top: 20),
                    child: InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>EditAccount(),));
                    },
                      child: Container(
                        height:height/14,
                        width: width/2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: maincolor
                        ),
                        child: Center(
                          child: Text("Edit account",
                            style: TextStyle(
                                color: Colors.white,
                            fontSize: 15,
                              fontWeight: FontWeight.normal,
                              fontFamily: "abeze"
                            ),),
                        ),
                      ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 80,top: 20),
                    child: Consumer<LogProvider>(
                      builder: (context,value,child) {
                        return Container(
                          height:height/14,
                          width:width/2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: maincolor
                          ),
                          child: Center(
                            child: InkWell(onTap: () {
                              value.logOutAlert(context);
                            },
                              child: Text("Log Out",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "abeze"
                                ),),
                            ),
                          ),
                        );
                      }
                    ),
                  ),



                ],
              ),

            );
          }
        ),




        // bottomNavigationBar: Container(
        //     height:height/11.5,
        //     width: width,
        //     color: maincolor,
        //
        //     child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.only(right: 70,top: 10),
        //           child: InkWell(onTap:  () {
        //             Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),));
        //           },
        //             child: Column(
        //               children: [
        //                 Icon(Icons.home,color: Colors.white,),
        //                 Text("Home",style: TextStyle(
        //                     color: Colors.white,fontFamily: "allerta"
        //                 ),),
        //               ],
        //             ),
        //           ),
        //         ),
        //
        //         InkWell(onTap: () {
        //           Navigator.push(context, MaterialPageRoute(builder: (context) => cart(userId: '',),));
        //         },
        //           child: Padding(
        //             padding: const EdgeInsets.only(right:80,top: 10),
        //             child: Column(
        //               children: [
        //                 Icon(Icons.shopping_cart_outlined,color: Colors.white,),
        //                 Text("Cart",style: TextStyle(
        //                     color: Colors.white,fontFamily: "allerta"
        //                 ),),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(top:10),
        //           child: InkWell(onTap: () {
        //             Navigator.push(context, MaterialPageRoute(builder: (context) => account(),));
        //           },
        //             child: Column(
        //               children: [
        //                 Icon(Icons.supervisor_account_rounded,color: Colors.blue,),
        //                 Text("Account",style: TextStyle(
        //                     color: Colors.blue,fontFamily: "allerta"
        //                 ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     )
        // ),
    ),
    );

  }
}

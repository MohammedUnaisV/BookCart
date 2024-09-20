import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Provider/Maine_Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowPage extends StatefulWidget {
  const ShowPage({super.key});

  @override
  State<ShowPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:  Scaffold(
      appBar: AppBar(backgroundColor: maincolor,
       title: Center(
         child: Text("show",
           style: TextStyle(
               color: Colors.white,
               fontFamily: "allerta"),
         ),
       ),
      ),
      backgroundColor: subcolor,
      body: Consumer<MaineProvider>(
        builder: (context,edit2,child) {
          return SingleChildScrollView(


            child:
            Column(
              children: [
              ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Stack(
                    children: [
                      Container(
                        height: 80,
                        width: 360,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black26,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 2),
                        child: Row(
                          children: [
                            Container(
                              height: 75,
                              width: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: edit2.addUserProfilePick != null
                                      ? FileImage(edit2.addUserProfilePick!)
                                      : AssetImage('assets/images/user_null.png') as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(width: 100),
                                Text(
                                 edit2.editTitleController.text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "allerta",
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text("₹150",
                                  // edit2.editPriceController.text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "allerta",
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),


              Padding(
                  padding: const EdgeInsets.only(top:450),
                  child: TextButton(onPressed: () {

                  } ,

                      child:
                      Container(
                        width: 56,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: maincolor,

                        ),
                        child: Center(
                          child: Text("OK",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "allerta"),
                          ),
                        ),
                      )
                  ),
                )
              ],
            ),

          );
        }
      ),

    )
    );

  }
}

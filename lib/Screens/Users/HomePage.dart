

import 'package:bookcartproject1/Constants/images.dart';
import 'package:bookcartproject1/Provider/Admin_Provider.dart';
import 'package:bookcartproject1/Provider/Log_Provider.dart';
import 'package:bookcartproject1/Provider/MaineProvider.dart';
import 'package:bookcartproject1/Screens/Users/Account.dart';
import 'package:bookcartproject1/Screens/Users/My_order.dart';
import 'package:bookcartproject1/Screens/Users/cart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '+1 guide.dart';
import '../../Constants/mycolors.dart';
import '../../example.dart';

class Homepage extends StatelessWidget {
  String userid;
  Homepage({super.key,
    required this.userid});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,  // Assign the key to Scaffold
        backgroundColor: subcolor,
        appBar: AppBar(
          backgroundColor: Color(0xff2C5F2D),
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();  // Open drawer on menu icon press
            },
          ),
          title: Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontFamily: "allerta",
            ),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),

        // Add a Drawer widget here
        drawer: Consumer<MainProvider>(
          builder: (context,value,child) {
            return Drawer(
              child: Container(
                color: maincolor,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color:Color(0xff102D11)
                      ),
                      accountName: Consumer<LogProvider>(
                        builder: (context,value1,child) {
                          return Text(value1.loginName);
                        }
                      ),
                      accountEmail: Consumer<LogProvider>(
                        builder: (context,value2,child) {
                          return Text(value2.loginPhoneNumber);
                        }
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: value.addUserProfilePick != null
                            ? FileImage(value.addUserProfilePick!)
                            : AssetImage('assets/images/user null.png') as ImageProvider
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.home,color: Colors.white,),
                      title: Text('Home',style: TextStyle(color: Colors.white),),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_cart,color: Colors.white,),
                      title: Text('Cart',style: TextStyle(color: Colors.white),),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(userId: userid)));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.supervisor_account,color: Colors.white,),
                      title: Text('Account',style: TextStyle(color: Colors.white),),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => account(userId: userid,)));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.my_location,color: Colors.white,),
                      title: Text('My Order',style: TextStyle(color: Colors.white),),

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrder()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.ads_click,color: Colors.white,),
                      title: Text('Advertising',style: TextStyle(color: Colors.white),),

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen()));
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        ),

        body: Consumer<AdminProvider>(builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Image.asset(
                    logo,
                    scale: 2.5,
                  ),
                ),

                SizedBox(height:height/15),
                // CarouselSlider widget
                Container(
                  height: height / 4,
                  width: width,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: height / 3,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                      enlargeCenterPage: true,
                    ),
                    items: value.CarouselGetList.map((item) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(item.photo),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(item.photo, fit: BoxFit.cover),
                      ),
                    )).toList(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 230, top: 10),
                  child: Text(
                    "Choose Category",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "akaya",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height:height/12),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Container(
                    height: height / 4.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: maincolor,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: value.CategoryList.length,
                      physics: ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        mainAxisExtent: 160,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            value.GetProdect();
                            value.filterProductsByCategory(value.CategoryList[index].categoryName);

                            // Navigate to PlusOneGuide with the selected category
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlusOneGuide(
                                  catergoryTitle: value.CategoryList[index].categoryName,
                                  userId: userid,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height:height/20,
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      height:height/8,
                                      width:width,
                                      decoration: BoxDecoration(
                                        color: maincolor,
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              value.CategoryList[index].categoryImage),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Text(
                                      value.CategoryList[index].categoryName,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "philosopher",
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }),

      ),
    );
  }
}

import 'package:bookcartproject1/Constants/images.dart';
import 'package:bookcartproject1/Provider/Admin_Provider.dart';
import 'package:bookcartproject1/Screens/Users/+1%20text.dart';
import 'package:bookcartproject1/Screens/Users/Account.dart';
import 'package:bookcartproject1/Screens/Users/cart.dart';
import 'package:bookcartproject1/Screens/Users/story%20books.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '+1 guide.dart';
import '+2 Text.dart';
import '+2 guide.dart';
import '../../Constants/mycolors.dart';
import '../../Constants/myfunctions.dart';
import 'English Novels.dart';
import 'Malayalam Novel.dart';
import 'PSC.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<Widget> booksname = [
      InkWell(onTap: () {},
          child:
          pluonetext()),
      plusoneguid(),
      plustwotext(),
      plustwoguide(),
      psc(),
      storybooks(),
      malayalamnovels(),
      englishnovels(),
    ];

    List<String> Carouselimg = [
      "assets/images/image 3.png",
      "assets/images/ad img.webp",
      "assets/images/add.png"
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: subcolor,
        appBar: AppBar(
          backgroundColor: Color(0xff2C5F2D),
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
                Container(
                  height: 40,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black, // Black border color
                      width: 1, // Border width
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
                          EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                      hintText: "",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),
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
                    items: Carouselimg.map((item) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                item,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(item, fit: BoxFit.cover),
                          ),
                        )).toList(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right:230,top:10),
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

                SizedBox(height: 20),
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
                            mainAxisExtent: 160),
                        itemBuilder: (context, index) {
                          // final cdproduct=value.CategoryList[index];
                          return InkWell(
                            onTap: () {
                              callNext(context, pluonetext());
                            },
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => booksname[index],
                                    ));
                              },
                              child: Container(
                                height: 80,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          height: 90,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color: maincolor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                  image: NetworkImage(value.CategoryList[index].categoryImage),
                                                  fit: BoxFit.fill)),
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
                            ),
                          );
                        },
                      )),
                ),
              ],
            ),
          );
        }),
        bottomNavigationBar: Container(
          height: 65,
          width: 350,
          color: maincolor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 70, top: 10),
                child: Column(
                  children: [
                    Icon(Icons.home, color: Colors.blue),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: "allerta",
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => cart(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 80, top: 10),
                  child: Column(
                    children: [
                      Icon(Icons.shopping_cart_outlined, color: Colors.white),
                      Text(
                        "Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "allerta",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => account(),
                        ));
                  },
                  child: Column(
                    children: [
                      Icon(Icons.supervisor_account_rounded,
                          color: Colors.white),
                      Text(
                        "Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "allerta",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

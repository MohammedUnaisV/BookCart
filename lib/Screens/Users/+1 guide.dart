import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Constants/mycolors.dart';
import '../../Provider/Admin_Provider.dart';
import '../../Provider/MaineProvider.dart';
import 'cart.dart';

class PlusOneGuide extends StatefulWidget {
  final String catergoryTitle;
  final String userId;

  PlusOneGuide({
    super.key,
    required this.catergoryTitle,
    required this.userId,
  });

  @override
  State<PlusOneGuide> createState() => _PlusOneGuideState();
}

class _PlusOneGuideState extends State<PlusOneGuide> {
  Map<String, int> quantities = {};

  @override
  void initState() {
    super.initState();
    // Get the provider and filter products based on the selected category
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    MainProvider mprovider = Provider.of<MainProvider>(context, listen: false);

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: maincolor,
              title: Text(
                widget.catergoryTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "allerta",
                  fontSize: 17,
                ),
              ),
              centerTitle: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
            backgroundColor: subcolor,
            body: Consumer<AdminProvider>(
                builder: (context, value, child) {
                  return SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: value.filteredProductsList.length,
                                itemBuilder: (context, index) {
                                  var product = value
                                      .filteredProductsList[index];
                                  return Padding(
                                      padding:
                                      const EdgeInsets.only(top: 25,
                                          left: 10,
                                          right: 10),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        height: height / 8,
                                        width: width / 1.5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          color: Colors.black26,
                                        ),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(
                                                height: height / 10,
                                                width: width / 6,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      12),
                                                  color: Colors.white,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        product.ProdectImage),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    right: 90, top: 15),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      product.ProdectTitel,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight
                                                            .normal,
                                                        fontFamily: "allerta",
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: height / 50),
                                                    Text(
                                                      product.ProdectPrice,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.normal,
                                                        fontFamily: "allerta",
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  // Add the product to the cart
                                                  mprovider.addToCart(
                                                     widget.userId,
                                                    product.ProductId,
                                                    product.ProdectImage,
                                                    product.ProdectPrice,
                                                    product.ProdectTitel,

                                                  );
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(content: Text("${product.ProdectTitel} added to cart")),
                                                  );
                                                  Navigator.push(context,MaterialPageRoute(builder: (context) =>    Cart(userId: widget.userId,),));
                                                },
                                                icon: Icon(Icons.add_shopping_cart_outlined),
                                              )


                                            ]
                                        ),


                                      )
                                  );
                                }
                            )
                          ]
                      )
                  );
                }
            )
        )
    );
  }
}





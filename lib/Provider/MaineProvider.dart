import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../Model/Model_class.dart';

class MainProvider extends ChangeNotifier{
  MainProvider(){

  }



  final FirebaseFirestore db = FirebaseFirestore.instance;


  // ...................profile add image.............................................


  final TextEditingController regphoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();




  Future<void> UserImageAdd(ImageSource source) async {


    final userImageadd = ImagePicker();
    final userPickedImage = await userImageadd.pickImage(source: source);

    if (userPickedImage != null) {
      await userImagecrop(userPickedImage.path);
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  Future<void> userImagecrop(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.white,
          toolbarWidgetColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Cropper'),
      ],
    );

    if (croppedFile != null) {
      addUserProfilePick = File(croppedFile.path);
      notifyListeners();
    }
  }

  String userProfileUrl = "";
  File? addUserProfilePick;





  // void userAddProfile() async {
  //
  //   try {
  //     String id = DateTime.now().millisecondsSinceEpoch.toString();
  //     Map<String, dynamic> userProfilePick = {
  //       "USER_IMAGE": userProfileUrl,
  //     };
  //
  //     // Check if there is an image file to upload
  //     if (addUserProfilePick != null) {
  //       // Check for addUserProfilePick
  //       String photoId = DateTime.now().millisecondsSinceEpoch.toString();
  //       Reference ref = FirebaseStorage.instance.ref().child(photoId);
  //
  //       // Upload the image file to Firebase Storage
  //       await ref.putFile(addUserProfilePick!).whenComplete(() async {
  //         String downloadUrl = await ref.getDownloadURL();
  //         userProfilePick["USER_IMAGE"] = downloadUrl;
  //
  //         await db.collection("USER_PROFILE_PICK").doc(id).set(userProfilePick);
  //         notifyListeners();
  //       });
  //     } else {
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //   }
  //
  //
  //   // Method to handle image picking
  //   Future<void> UserImageAdd(ImageSource source) async {
  //     final ImagePicker picker = ImagePicker();
  //     final XFile? image = await picker.pickImage(source: source);
  //
  //     if (image != null) {
  //       addUserProfilePick = File(image.path);
  //       notifyListeners();
  //     }
  //   }
  // }

//   ...............................................................end.............


//   ..........................AddToCart..................

  void userAddProfileToDatabase() async {
    try {
      // ഒരു പ്രത്യേക ID ഉണ്ടാക്കുന്നു, ഇപ്പൊഴത്തെ സമയം(milliseconds) അടിസ്ഥാനമാക്കി.
      String id = DateTime.now().millisecondsSinceEpoch.toString();

      // ഉപയോക്തൃ പ്രൊഫൈൽ ചിത്രം സംബന്ധിച്ച മാപ്പ് ക്രമീകരിക്കുന്നു.
      Map<String, dynamic> userProfileData = {
        "USER_IMAGE": userProfileUrl, // userProfileUrl ആണ് ചിത്രത്തിന്റെ പ്രാഥമിക വിലാസം.
      };

      // ചിത്രം അപ്പ്‌ലോഡ് ചെയ്യേണ്ട ആവശ്യകത പരിശോധിക്കുന്നു.
      if (addUserProfilePick != null) {
        // പ്രൊഫൈൽ ചിത്രത്തിനുള്ള ID ഉണ്ടാക്കുന്നു.
        String photoId = DateTime.now().millisecondsSinceEpoch.toString();
        Reference ref = FirebaseStorage.instance.ref().child(photoId);

        // ചിത്രം Firebase Storage-ലേക്ക് അപ്‌ലോഡ് ചെയ്യുന്നു.
        await ref.putFile(addUserProfilePick!).whenComplete(() async {
          // ചിത്രത്തിന്റെ ഡൗൺലോഡ് URL എടുക്കുന്നു.
          String downloadUrl = await ref.getDownloadURL();
          userProfileData["USER_IMAGE"] = downloadUrl;

          // User Profile ഡാറ്റാബേസിൽ ID ഉപയോഗിച്ച് ചേർക്കുന്നു.
          await db.collection("USER_PROFILE_PICK").doc(id).set(userProfileData);
          notifyListeners(); // UI അപ്ഡേറ്റ് ചെയ്യുന്നു.
        });
      } else {
        notifyListeners(); // UI അപ്ഡേറ്റ് ചെയ്യുന്നു.
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // ......................end.........................................

  List<CartProdectDtls>cartList=[];

  // Map to hold TextEditingControllers for each product
  Map<String,TextEditingController>countController={};
  Map<String,TextEditingController>totalPriceController={};
// Method to initialize controllers
  void initController(String ProductId, double unitPrice) {
    countController[ProductId] ??= TextEditingController(text: '1'); // Default quantity 1
    totalPriceController[ProductId] ??= TextEditingController(text: unitPrice.toStringAsFixed(2));
  }
  // Increment function
  void increment(String ProductId, double unitPrice, String userId) {
    int currentCount = int.parse(countController[ProductId]?.text ?? '1');
    currentCount++;
    countController[ProductId]?.text = currentCount.toString();
    notifyListeners();


    // Update total price for that product
    double totalPrice = currentCount * unitPrice;
    totalPriceController[ProductId]?.text = totalPrice.toStringAsFixed(2);






    notifyListeners(); // Notify UI about changes
  }

  // Decrement function
  void decrement(String ProductId, double unitPrice, String userId) {
    int currentCount = int.parse(countController[ProductId]?.text ?? '1');
    if (currentCount > 1) {
      currentCount--;
      countController[ProductId]?.text = currentCount.toString();
      print("mmmmmmmmmm $currentCount  ${countController[ProductId]?.text}");

      double totalPrice = currentCount * unitPrice;
      totalPriceController[ProductId]?.text = totalPrice.toStringAsFixed(2);





      notifyListeners(); // Notify UI about changes
    }
  }
  void addToCart(
      String userId,String ProductId,String ProdectImage,String ProdectPrice,String ProdectTitel,){

    int productCount=0;
    if(countController[ProductId]!=null) {
      productCount = int.parse(countController[ProductId]!.text);
    }
    double totalPrice=0;
    if(totalPriceController[ProductId]!=null) {
      totalPrice = double.parse(totalPriceController[ProductId]!.text);
    }



    HashMap<String,dynamic>cart=HashMap();
    cart["PRODECT_TITEL"]=ProdectTitel;
    cart["PHOTO"]=ProdectImage;
    cart["PRODUCT_PRICE"]=ProdectPrice; // Save the price as a string with 2 decimal places
    cart["PRODUCT_COUNT"]=productCount;
    cart["TOTAL_PRICE"]=totalPrice;
    db.collection("USERS").doc(userId).collection("CART").doc(ProductId).set(cart,SetOptions(merge: true));
    getAddedCart(userId);
    updateGrandTotal();
    notifyListeners();
  }

  void getAddedCart(String userId) {
    db.collection("USERS").doc(userId).collection("CART").get().then((value) {
      if (value.docs.isNotEmpty) {
        cartList.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> cart = element.data();
          cartList.add(CartProdectDtls(
            element.id,
            cart["PRODECT_TITEL"]?.toString() ?? "",
            cart["PHOTO"] ?? "",
            cart["PRODUCT_PRICE"] ?? "",
            cart["PRODUCT_COUNT"]?.toString() ?? "",
            cart["TOTAL_PRICE"]?.toString() ?? "",
            cart["CATEGORY_NAME"]?.toString() ?? "",
            cart["CATEGORY_ID"]?.toString() ?? "",
          ));
        }
        notifyListeners(); // Move this outside the for loop
      }
    });
  }




  void addGrandTotalToUsers(String userId){
    // First, calculate the grand total
    double grandTotal=calculateGrandTotal();
    // Prepare the data to store in Firestore
    Map<String,dynamic>cart_total={
      "CART_GRANDTOTAL":grandTotal
    };
    db.collection("USERS").doc(userId).set(cart_total,SetOptions(merge: true)).then((value) {
    },).catchError((error){
    }
    );
  }

  // Grand total calculation
  double calculateGrandTotal() {
    double grandTotal = 0.0;
    for (var product in cartList) {
      String ProductId = product.ProductId;
      double productTotal = double.parse(totalPriceController[ProductId]?.text ?? '0');
      grandTotal += productTotal;
    }
    return grandTotal;
  }

  // Method to update grand total
  void updateGrandTotal() {
    notifyListeners(); // Notify the UI that the grand total has changed
  }
  double grandTotal=0.0;
  void getGrandTotal(String userId)async{
    try{
      DocumentSnapshot doc=await db.collection("USERS").doc(userId).get();
      if (doc.exists){
        if(doc.data()!=null&&doc["CART_GRANDTOTAL"]!=null){
          grandTotal=doc["CART_GRANDTOTAL"];
          notifyListeners();
        }
      }
    }
    catch(e){
      print("Failed to fetch grand total:$e");
    }

  }

  void deleteProductFromCart(String userId,String ProductId){
    db.collection("USERS").doc(userId).collection("CART").doc(ProductId).delete();
    print("You deleted product from cart-----------------");
    getAddedCart(userId);
    notifyListeners();
  }



}
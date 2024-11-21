import 'package:bookcartproject1/Screens/Users/cart.dart';

class LoginDetails{
  String id;
  String phonenumber;
  String password;
  LoginDetails (this.id,this.phonenumber,this.password);
}

class UserProfiledetails{
  String id;
  String profileImage;
  UserProfiledetails(this.id,this.profileImage);
}

class GetCategory{
  String CategoryId;
  String categoryName;
  String categoryImage;
  GetCategory(this.CategoryId,this.categoryName,this.categoryImage);
}


class GetProdectDtls{
  String ProductId;
  String ProdectPrice;
  String ProdectTitel;
  String ProdectImage;
  String categoryName;
  String categoryId;
  GetProdectDtls(this.ProductId,this.ProdectTitel,this.ProdectImage,this.ProdectPrice,
    this.categoryName ,this.categoryId);
}
class CartProdectDtlsModel{
  String ProductId;
  String ProdectPrice;
  String ProdectTitel;
  String totalPrice;
  String productCount;
  String ProdectImage;
  String categoryName;
  String categoryId;
  CartProdectDtlsModel(this.ProductId,this.ProdectTitel,this.ProdectImage,this.ProdectPrice,
      this.productCount,this.totalPrice,this.categoryName ,this.categoryId);
}


class GetCaruoselDtls {
  String id;
  String photo;
  GetCaruoselDtls(this.id, this.photo);
}
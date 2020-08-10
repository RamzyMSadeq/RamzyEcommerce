import 'dart:io';

import 'package:e_commerce_project/features/admin/repositories/admin_client.dart';
import 'package:e_commerce_project/features/user/Repositories/db_repository.dart';
import 'package:e_commerce_project/features/user/Repositories/user_Client.dart';
import 'package:e_commerce_project/features/user/Repositories/user_repository.dart';
import 'package:e_commerce_project/models/order_model.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:e_commerce_project/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_commerce_project/models/cart_model.dart';


class ECProvider extends ChangeNotifier{
  String currentEmail = "";
  String currentid = "";
  List<CartModel> allCart = [];
  UserModel userModel ;
  String userEmail;
  String userPassword;
  bool isAdmin  ;
  String imgProfile;
  String imgCover;
  String address;
  String pio;
  double latitude;
  double longitude;
  String mobileNum;
  String userName;
  String userIdTest ;
  bool indecator = false;
  FirebaseUser currentUser;
  List<ProductModel> allOfferProducts;
  List<UserModel> allStore;
  UserModel profileStore ;
  double totalCart=0;
  List<Order> allOrder;
  List<ProductModel> searchProduct;
  String search2='';
   int count=0;
   List<Map<String, dynamic>> allCart2;
   List<CartModel> orders2;

   setCount(int value){
    this.count = value;
    notifyListeners();
  }
  
    setIndicator(bool value){
    this.indecator = value;
    notifyListeners();
  }

  setSearch(String value){
    this.search2 = value;
    notifyListeners();
  }

  settotalCart(double value){
    this.totalCart += value;
    notifyListeners();
  }
  settotalCartDe(double value){
    this.totalCart -= value;
    notifyListeners();
  }
  setUserEmail(String value){
    this.userEmail = value;
  }
  setUserPassword(String value){
    this.userPassword = value;
  }
  setIsAdmin(bool value){
    this.isAdmin = value;
  }
  setImgProfile(String value){
    this.imgProfile = value;
  }
  setImgCover(String value){
    this.imgCover = value;
  }
  setAddress(String value){
    this.address = value;
  }
  setPio(String value){
    this.pio = value;
  }
  setLatitude(double value){
    this.latitude= value;
  }
  setLongitude(double value){
    this.longitude = value;
  }
  setMobileNum(String value){
    this.mobileNum = value;
  }
  setUserName(String value){
    this.userName = value;
  }
  setUserIdTest(String value){
    this.userIdTest = value;
  }

  setCurrentUser(FirebaseUser firebaseUser){
        this.currentUser = firebaseUser;
  }
 
  Future<bool> addNewUserToFirbase()async{
    UserModel userM = UserModel(
      email: this.userEmail,
      password: this.userPassword,
      isAdmin: this.isAdmin,
      userId: this.userIdTest,
      imgProfile: this.imgProfile,
      imgCover: this.imgCover,
      address: this.address,
      pio: this.pio,
      mobileNum: this.mobileNum,
      name: this.userName,
      latitude: this.latitude,
      longitude: this.longitude
    );
    String userId = await  AdminClient.adminClient.addNewUser(userM);
    if(userId != null){
      return true;
    }else{
      return false;
    }


  }



  // getUserData(String uId)async{

  //   UserModel userMod = await AdminRepository.adminRepository.getUser(uId);
  //   this.userModel = userModel;
  //   userIdTest = userModel.userId;
  //   notifyListeners();
  //   return userMod;

  // }

getAllCart()async{
   List<CartModel> allproduct = await DBRepository.dbRepository.getAllCart();
   this.allCart = allproduct;
   this.allCart2 = List<Map<String, dynamic>>();
   allproduct.forEach((element) {
        this.allCart2.add(element.toJson());
   });
   
   
   notifyListeners();
}

insertNewCartProduct(CartModel cartModel)async{
  await DBRepository.dbRepository.insertNewProductCart(cartModel);
  getAllCart();

}

deleteProductCart(CartModel cartModel)async{
  await DBRepository.dbRepository.deleteProductCart(cartModel);
  getAllCart(); 
}
deleteAllProductCart()async{
  await DBRepository.dbRepository.deleteAllProductsCart();
  getAllCart(); 
}

getOfferProducts()async{
   List<ProductModel>products = await  UserRepository.userRepository.getIsOfferProducts();

   this.allOfferProducts= products;
   
   notifyListeners();
  }

  getAllStore()async{
    List<UserModel> myList = await UserRepository.userRepository.getAllStore();
   this.allStore= myList;
   print("sdllfkskgkof ${this.allStore.length}");
   notifyListeners();
  }

    getStoreById(String storId)async{
    List<UserModel> myList = await UserRepository.userRepository.getStoreById(storId);
   this.profileStore= myList.first;
   notifyListeners();
  }

  insertNewOrder(Order order)async{
    
   await UserClient.userClient.addNewOrder(order);

}

getAllOrder()async{
    
   List<Order> myList = await UserRepository.userRepository.getAllOrders();
    this.allOrder = myList;
    
    
   notifyListeners();
}

getSearchProducts(String key)async{
   List<ProductModel>products = await  UserRepository.userRepository.getSearchProducts(key);

   this.searchProduct= products; 
   notifyListeners();
  }

  editUser(UserModel userModel)async{
    await UserClient.userClient.editeUser(userModel);
    
  }

   updateData(String documentId , String key , dynamic value) async {
     await UserClient.userClient.updateData(documentId, key, value);
  }


uploadImageProfile(File fileImage , String collec)async{
    String imageurl =   await AdminClient.adminClient.uploadImage(fileImage , collec);
    this.imgProfile = imageurl;
    notifyListeners();
  }

uploadImageCover(File fileImage , String collec)async{
    String imageurl =   await AdminClient.adminClient.uploadImage(fileImage , collec);
    this.imgCover = imageurl;
    notifyListeners();
  }

  

}
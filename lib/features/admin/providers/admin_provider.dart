

import 'dart:io';

import 'package:e_commerce_project/Services/auth_service.dart';
import 'package:e_commerce_project/features/admin/repositories/admin_client.dart';
import 'package:e_commerce_project/features/admin/repositories/admin_repository.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:e_commerce_project/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AdminProvider extends ChangeNotifier{

  List<ProductModel> allProducts;
  String imageUrl;
  String title;
  double rating;
  double price;
  bool isOffer;
  double discount;
  String category ;
  String subCategory;
  FirebaseUser currentUser;
  ProductModel myProduct;
  UserModel userById  ;
  bool indecator = false;

  List<ProductModel> myProductsToAdmin;
  
  
  File imageFile;
  String idStore;
  String valueSearch;

  
   setIndicator(bool value){
    this.indecator = value;
    notifyListeners();
  }

  setValueSearch(String value){
    this.valueSearch = value;
  }

  setImageUrl(String value){
    this.imageUrl = value;
  }
  setTitle(String value){
    this.title = value;
  }
  setRating(String value){
    this.rating = double.parse(value);
  }
  setPrice(String value){
    this.price = double.parse(value);
  }
  setIsOffer(bool value){
    this.isOffer = value;
  }
  setDiscount(String value){
    this.discount = double.parse(value);
  }
  setCategory(String value){
    this.category = value;
  }
  setSubCategory(String value){
    this.subCategory = value;
  }
  setStorId(String value){
    this.idStore = value;
  }
  setImageFile(File file){
    this.imageFile = file;

  }
   currentUserId()async{
    FirebaseUser firebaseUser= await  AuthService.auth.firebaseAuth.currentUser();
    this.currentUser = firebaseUser;
    notifyListeners();
    
  }
  uploadImage(File fileImage , String collec)async{
    String imageurl =   await AdminClient.adminClient.uploadImage(fileImage , collec);
    this.imageUrl = imageurl;
    notifyListeners();
  }
  Future<bool> addNewProduct()async{
    ProductModel productModel = 
    ProductModel(
      imageUrl: this.imageUrl,
      title: this.title,
      rating: this.rating,
      price: this.price,
      isOffer: this.isOffer,
      discount: this.discount,
      category: this.category,
      subCategory: this.subCategory,
      storeId: this.idStore
    );
    String productId = await AdminClient.adminClient.addNewProduct(productModel);
    if(productId != null){
      getAllProducts();
      
      return true;
    }else{
      return false;
    }
  }
  getAllProducts()async{
   List<ProductModel>products = await  AdminRepository.adminRepository.getAllProducts();

   this.allProducts = products;
   
   notifyListeners();
  }
  editProduct(ProductModel productModel)async{
    await AdminClient.adminClient.editeProduct(productModel);
    getAllProducts();
  }
  
  deleteProduct(String documentId)async{
    await AdminClient.adminClient.deleteProduct(documentId);
    getAllProducts();
  }

  getProductById(ProductModel prmd)async{
    ProductModel productModel = await AdminRepository.adminRepository.getProductById(prmd);
    this.myProduct = productModel;
    notifyListeners();

  }

  getProductByUserId(String idUser)async{

    List<UserModel> myList=  await AdminRepository.adminRepository.getProductByUserId(idUser);
    this.userById = myList.first;
    
    notifyListeners();

  }

  
  getMyProduct(String idUser)async{

    List<ProductModel> myList=  await AdminRepository.adminRepository.getMyProduct(idUser);
    this.myProductsToAdmin = myList;
    print("rrrrrrrrrrrrrrr ${myProductsToAdmin.length}");
    
    notifyListeners();

  }



}
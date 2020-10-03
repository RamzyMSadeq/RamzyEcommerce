import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/models/category.dart';

class ProductModel{
  String documentId;
  String imageUrl;
  String title;
  double rating;
  double price;
  bool isOffer;
  double discount;
  String category ;
  String subCategory;
  String storeId;

  ProductModel({
    this.documentId ,
    this.imageUrl,
    this.title,
    this.rating,
    this.price,
    this.isOffer,
    this.discount,
    this.category,
    this.subCategory,
    this.storeId
  });

  ProductModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot){
    this.documentId = documentSnapshot.id;
    this.imageUrl = documentSnapshot.data()['imageUrl'];
    this.title = documentSnapshot.data()['title'];
    this.rating = documentSnapshot.data()['rating'];
    this.price = documentSnapshot.data()['price'];
    this.isOffer = documentSnapshot.data()['isOffer'];
    this.discount = documentSnapshot.data()['discount'];
    this.category = documentSnapshot.data()['category'];
    this.subCategory = documentSnapshot.data()['subCategory'];
    this.storeId = documentSnapshot.data()['storeId'];

  }

  toJsone(){
    return {
      'imageUrl' : this.imageUrl,
      'title' : this.title,
      'rating' : this.rating,
      'price' : this.price,
      'isOffer' : this.isOffer,
      'discount' : this.discount,
      'category' : this.category,
      'subCategory' : this.subCategory,
      'storeId' : this.storeId

    };
  }
}

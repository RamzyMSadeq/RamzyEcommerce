import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/features/user/Repositories/db_product.dart';
class CartModel{
  int id;
  String userId;
  String traderId;
  String productId;
  String imageUrlProduct;
  String titleProduct;
  double price;
  
  

  CartModel({
       this.userId,
       this.traderId,
       this.productId,
       this.imageUrlProduct,
       this.titleProduct,
       this.price
       });

  CartModel.fromJson(Map<String , dynamic> map){
    this.id = map['${DBProduct.idTable}'];
    this.userId = map['${DBProduct.idUserColumn}'];
    this.traderId = map['${DBProduct.idTraderColumn}'];
    this.productId = map['${DBProduct.idProductColumn}'];
    this.imageUrlProduct = map['${DBProduct.imagUrlProductColumn}'];
    this.titleProduct = map['${DBProduct.titleProductColumn}'];
    this.price = map['${DBProduct.priceProductColum}'];
  }
  
  CartModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot){
    this.userId = documentSnapshot.data['${ DBProduct.idUserColumn}'];
    this.traderId = documentSnapshot.data['${ DBProduct.idTraderColumn}'];
    this.productId = documentSnapshot.data['${ DBProduct.idProductColumn}'];
    this.imageUrlProduct = documentSnapshot.data['${ DBProduct.imagUrlProductColumn}'];
    this.titleProduct = documentSnapshot.data['${ DBProduct.titleProductColumn}'];
    this.price = documentSnapshot.data['${ DBProduct.priceProductColum}'];
    
  }

  
  

  toJson(){
    return{
      DBProduct.idUserColumn : this.userId,
      DBProduct.idTraderColumn : this.traderId,
      DBProduct.idProductColumn : this.productId ,
      DBProduct.imagUrlProductColumn : this.imageUrlProduct ,
      DBProduct.titleProductColumn : this.titleProduct ,
      DBProduct.priceProductColum : this.price ,
    };
  }
}
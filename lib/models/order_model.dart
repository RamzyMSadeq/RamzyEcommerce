import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/models/cart_model.dart';

class Order{
  String documentId;
  List<Map<String, dynamic>> orders;
  String userId;
  String address;
  String date;
  String totalPrice;
  bool isDelivery;
  int count ;

  Order(
    
    this.orders,
     this.userId ,
      this.address , 
      this.date ,
      this.totalPrice ,
       this.isDelivery,
       this.count
       );

       

       Order.fromDocumentSnapshot(DocumentSnapshot documentSnapshot){
         // List<Map<String, dynamic>> ordersMap;
    this.documentId = documentSnapshot.id;
    this.orders = List<Map<String, dynamic>>();
    documentSnapshot.data()['orders'].forEach((v) {
      this.orders.add( CartModel.fromJson(v).toJson());
    });
    this.userId = documentSnapshot.data()['userId'];
    this.address = documentSnapshot.data()['address'];
    this.date = documentSnapshot.data()['date'];
    this.totalPrice = documentSnapshot.data()['totalPrice'];
    this.isDelivery = documentSnapshot.data()['isDelivery'];
    this.count = documentSnapshot.data()['count'];
  }

  toJsone(){
    return {
         'orders' : orders,
         'userId' : userId,
         'address' : address,
         'date' : date,
         'totalPrice' : totalPrice,
          'isDelivery' : isDelivery,
          'count' : count,
      };
  }
}
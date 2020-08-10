import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String id ;
  String email;
  String password;
  bool isAdmin ;
  String userId;
  String imgProfile;
  String imgCover;
  String address;
  String pio;
  String mobileNum;
  String name;
  double latitude;
  double longitude;


  UserModel({
    this.id ,
     this.email ,
      this.password ,
       this.isAdmin,
       this.userId,
       this.imgProfile,
       this.imgCover,
       this.address,
       this.pio,
       this.mobileNum,
       this.name,
       this.latitude,
       this.longitude
       });


  UserModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot){
    this.id = documentSnapshot.documentID;
    this.email = documentSnapshot.data["email"];
    this.password = documentSnapshot.data["password"];
    this.isAdmin = documentSnapshot.data["isAdmin"];
    this.userId =  documentSnapshot.data["userId"];
    this.imgProfile =  documentSnapshot.data["imgProfile"];
    this.imgCover =  documentSnapshot.data["imgCover"];
    this.address =  documentSnapshot.data["address"];
    this.pio =  documentSnapshot.data["pio"];
    this.mobileNum =  documentSnapshot.data["mobileNum"];
    this.name =  documentSnapshot.data["name"];
    this.latitude = documentSnapshot.data["latitude"];
    this.longitude = documentSnapshot.data["longitude"];

  }

  toJson(){
    return {  
      
      "email" : this.email,
      "password" : this.password,
      "isAdmin" : this.isAdmin,
      "userId" : this.userId,
      "imgProfile" : this.imgProfile,
      "imgCover" : this.imgCover,
      "address" : this.address,
      "pio" : this.pio,
      "mobileNum" : this.mobileNum,
      "name" : this.name,
      "latitude" : this.latitude,
      "longitude" : this.longitude
    };
  }
}
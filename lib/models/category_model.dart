import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String documentId;
  String imageUrl;
  String title;
  

  CategoryModel({
    this.documentId ,
    this.imageUrl,
    this.title,
    
  });

  CategoryModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot){
    this.documentId = documentSnapshot.id;
    this.imageUrl = documentSnapshot.data()['imageUrl'];
    this.title = documentSnapshot.data()['title'];

  }

  toJsone(){
    return {
      'imageUrl' : this.imageUrl,
      'title' : this.title,
    };
  }
}

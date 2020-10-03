import 'package:cloud_firestore/cloud_firestore.dart';

class SliderModel{
  String documentId;
  String imageUrl;
  String title;
  String discontTitle;
  

  SliderModel({
    this.documentId ,
    this.imageUrl,
    this.title,
    this.discontTitle
    
  });

  SliderModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot){
    this.documentId = documentSnapshot.id;
    this.imageUrl = documentSnapshot.data()['imageUrl'];
    this.title = documentSnapshot.data()['title'];
    this.discontTitle = documentSnapshot.data()['discontTitle'];

  }

  toJsone(){
    return {
      'imageUrl' : this.imageUrl,
      'title' : this.title,
      'discontTitle' : this.discontTitle
    };
  }
}

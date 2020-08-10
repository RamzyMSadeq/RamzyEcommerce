
import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:e_commerce_project/features/admin/repositories/admin_client.dart';
import 'package:e_commerce_project/features/admin/ui/dashboard/screens/home_dashboard.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/Repositories/handler.dart';
import 'package:e_commerce_project/features/user/ui/Screens/homepage2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class AuthService{
  AuthService._();

  static final AuthService auth = AuthService._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> registerWithEmail(String email , String pass)async{
    try{
     AuthResult authResult = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass); 
     String userId = authResult.user.uid;  
     
     return userId;  
       
    }catch(e){
       print(e);
     }

  }
  redirect(BuildContext context)async{
    firebaseAuth.currentUser().then((user) {
      AdminClient.adminClient.firestore
      .collection("LogInUsers")
      .where('userId', isEqualTo: user.uid)
      .getDocuments()
      .then((value){
        if(value.documents[0].exists){
           if(value.documents[0].data['isAdmin']==true){
              HandlSt.handlSt.setShared(user.uid, true , 'Admin');
              Provider.of<AdminProvider>(context , listen: false).setImageUrl(null);
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
               builder: (context)=>HomeDashboard()),
               (route) => false);
            
           }else{
             HandlSt.handlSt.setShared(user.uid, true , 'User');
             Provider.of<ECProvider>(context ,listen: false)
             .setCurrentUser(user);
             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
               builder: (context)=>HomePage2()),
               (route) => false);
           }
        }
      });

    });

  }
  

  Future< FirebaseUser> logInWithEmail(String email , String pass) async{
    try{
      AuthResult result =
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
       String userId = result.user.uid;
      FirebaseUser user = result.user;
      
     
     return user;
    }catch(e){
      print(e);
    }
     
  }
 

  registerWithGoogle()async{
     try{
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      String idToken=  googleSignInAuthentication.idToken;
      String accessToken=  googleSignInAuthentication.accessToken;
      AuthCredential authCredential= await GoogleAuthProvider.getCredential(idToken: idToken, accessToken: accessToken);
      AuthResult authResult = await firebaseAuth.signInWithCredential(authCredential);

      return authResult.user;

    }catch(e){
      print(e);
    }

  }
 
  logOut(){
    HandlSt.handlSt.setShared('', false ,'');
     firebaseAuth.signOut();
  }

}
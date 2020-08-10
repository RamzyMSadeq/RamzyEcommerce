import 'package:e_commerce_project/Services/auth_service.dart';
import 'package:e_commerce_project/features/admin/ui/dashboard/screens/home_dashboard.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/Repositories/handler.dart';
import 'package:e_commerce_project/features/user/ui/Screens/current_map.dart';
import 'package:e_commerce_project/features/user/ui/Screens/logIn_Screen2.dart';
import 'package:e_commerce_project/features/user/ui/widgets/textFiels_Login_reg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';


class RegisterTrader extends StatelessWidget {
   GlobalKey<FormState> globalKey2;
   RegisterTrader(this.globalKey2);

  String storeName;
  String storeEmail;
  String storePassword;
  String storeType;
  

  saveStoreName(String value){
    this.storeName=value;   
  }
  saveStoreEmail(String value){
    this.storeEmail=value;   
  }
  saveStorePassword(String value){
    this.storePassword=value;   
  }
  saveStoreType(String value){
    this.storeType=value;   
  }

  validateStoreName(String value){
    if(value==null || value ==''){
      return 'This Field is required';
    }
    else if(!isAlpha(value)){
      return 'This Field is incorrect';
    }
  }

  validateStoreEmail(String value){
    if(value==null || value ==''){
      return 'This Field is required';
    }
    else if(!isEmail(value)){
      return 'This Field is incorrect';
    }
  }

  validateStorePassword(String value){
    if(value==null || value ==''){
      return 'This Field is required';
    }
    else if(!isAlphanumeric(value)){
      return 'This Field is incorrect';
    }
  }

  validateStoreType(String value){
    if(value==null || value ==''){
      return 'This Field is required';
    }
    else if(!isAlpha(value)){
      return 'This Field is incorrect';
    }
  }

  submitForm(){
    if(globalKey2.currentState.validate()){
      globalKey2.currentState.save();
      return globalKey2.currentState.validate();

    }else{
      return false;
    }

  }




  @override
  Widget build(BuildContext context) {
    ECProvider ecProvider= Provider.of<ECProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.all(20),

      child: Form(
        key: globalKey2,
        child: Column(
        children: <Widget>[
          TextFiledLogInReg(
            hintName:'The Store Name' ,
             iconName: Icon(Icons.person_outline , size: 25,),
             validationFun: validateStoreName,
            saveFormField: saveStoreName,
             
             ),
                  SizedBox(height: 10,),
          TextFiledLogInReg(
            hintName:'The Email' ,
             iconName: Icon(Icons.alternate_email , size: 25,),
             validationFun: validateStoreEmail,
            saveFormField: saveStoreEmail,
             ),
                  SizedBox(height: 10,),
            
          TextFiledLogInReg(
            hintName:'The Password' ,
             iconName: Icon(Icons.lock_outline , size: 25,),
             validationFun: validateStorePassword,
            saveFormField: saveStorePassword,
             ),
                  SizedBox(height: 10,),
          TextFiledLogInReg(
            hintName:'The Store Type' ,
             iconName: Icon(Icons.lock_outline , size: 25,),
             validationFun: validateStoreType,
            saveFormField: saveStoreType,
             ),
                  SizedBox(height: 15,),
                  Container(
                   // margin: EdgeInsets.symmetric(horizontal: 30),
                    width: 400,
                    height: 55,
                    
                    decoration: BoxDecoration(
                      color: style.Colors.mainColor,
                      borderRadius:BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(40),
                            ) ,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.grey[500],
                          offset: Offset(1, 3)
                        )
                      ]

                    ),
                    child: FlatButton(onPressed: () async{
                      if(submitForm()){
                        ecProvider.setIndicator(true);
                        String idUser = await AuthService.auth.registerWithEmail(storeEmail, storePassword);
                        HandlSt.handlSt.setShared(idUser, true , 'Admin');
                        Provider.of<ECProvider>(context , listen: false).setUserEmail(storeEmail);
                      Provider.of<ECProvider>(context , listen: false).setUserPassword(storePassword);
                      Provider.of<ECProvider>(context , listen: false).setIsAdmin(true);
                      Provider.of<ECProvider>(context , listen: false).setUserIdTest(idUser);
                      Provider.of<ECProvider>(context , listen: false).setUserName(storeName);
                      Provider.of<ECProvider>(context , listen: false).setImgProfile('https://cdn.hipwallpaper.com/i/29/35/VzvAlh.jpg');
                      Provider.of<ECProvider>(context , listen: false).setImgCover('https://cdn.hipwallpaper.com/i/29/35/VzvAlh.jpg');
                      //print( Provider.of<ECProvider>(context , listen: false).isAdmin);
                     // Provider.of<ECProvider>(context , listen: false).addNewUserToFirbase();
                      print('DDDDDDDDDDDDDDDDDDDDd');
                        ecProvider.setIndicator(false);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context)=>CurrentMap(
                              idUser,
                              storeEmail,
                              storePassword,
                              storeName
                            )));
                          
                      // print(user.email);
                      }
                    },
                    //color: style.Colors.mainColor,
                   // padding: EdgeInsets.symmetric(horizontal: 160, vertical: 23),
                   

                     child: Text('Sign Up', style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                       color: style.Colors.titleColor
                      
                     ),),
                     
                     ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('have a account? ',
                      style: GoogleFonts.poppins(
                          color: style.Colors.hintColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (contex) => LogInScreens()));
                    },
                    child: Text(' Log In',
                        style: GoogleFonts.poppins(
                            color: style.Colors.mainColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 10,),
               ecProvider.indecator == true 
            ?
            CircularProgressIndicator(backgroundColor: Colors.red,)
            :
            Container()


        ],
      ),
        )
      
    );
  }
}
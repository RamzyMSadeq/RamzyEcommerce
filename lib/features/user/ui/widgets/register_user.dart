import 'package:e_commerce_project/Services/auth_service.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/Repositories/handler.dart';
import 'package:e_commerce_project/features/user/ui/Screens/homepage2.dart';
import 'package:e_commerce_project/features/user/ui/Screens/logIn_Screen2.dart';
import 'package:e_commerce_project/features/user/ui/widgets/textFiels_Login_reg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';


class RegisterUser extends StatelessWidget {
  GlobalKey<FormState> globalKey;
  RegisterUser(this.globalKey);
  
  String userName;
  String userEmail;
  String userPassword;
  String userPasswordAgain;
  

  saveUserName(String value){
    this.userName=value;   
  }
  saveUserEmail(String value){
    this.userEmail=value;   
  }
  saveUserPassword(String value){
    this.userPassword=value;   
  }
  saveUserPasswordAgain(String value){
    this.userPasswordAgain=value;   
  }
   validateUserName(String value){
    if(value==null || value ==''){
      return 'This Field is required';
    }
    else if(!isAlpha(value)){
      return 'This Field is incorrect';
    }
  }

  validateUserEmail(String value){
    if(value==null || value ==''){
      return 'This Field is required';
    }
    else if(!isEmail(value)){
      return 'This Field is incorrect';
    }
  }

  validateUserPassword(String value){
    if(value==null || value ==''){
      return 'This Field is required';
    }
    else if(!isAlphanumeric(value)){
      return 'This Field is incorrect';
    }
  }
  validateUserPasswordAgain(String value){
    if(value==null || value ==''){
      return 'This Field is required';
    }
    else if(!isAlphanumeric(value)){
      return 'This Field is incorrect';
    }
  }
  submitForm(){
    if(globalKey.currentState.validate()){
      globalKey.currentState.save();
       return globalKey.currentState.validate();

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
        key: globalKey,
        child: Column(
        children: <Widget>[
          
          TextFiledLogInReg(
            hintName:'The User Name' ,
             iconName: Icon(Icons.person_outline , size: 25,),
             validationFun: validateUserName,
             saveFormField: saveUserName,
             ),
                  SizedBox(height: 10,),
          TextFiledLogInReg(
            hintName:'The Email' ,
             iconName: Icon(Icons.alternate_email , size: 25,),
             validationFun: validateUserEmail,
            saveFormField: saveUserEmail,
             ),
                  SizedBox(height: 10,),
          TextFiledLogInReg(
            hintName:'The Password' ,
             iconName: Icon(Icons.lock_outline , size: 25,),
             validationFun: validateUserPassword,
            saveFormField: saveUserPassword,
             ),        
                  SizedBox(height: 10,),
          TextFiledLogInReg(
            hintName:'The Password Again' ,
             iconName: Icon(Icons.lock_outline , size: 25,),
             validationFun: validateUserPasswordAgain,
            saveFormField: saveUserPasswordAgain,
             ), 
                  SizedBox(height: 15,),

                  Container(
                    //margin: EdgeInsets.symmetric(horizontal: 30),
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
                      String idUser = await AuthService.auth.registerWithEmail(userEmail, userPasswordAgain);
                      
                      print(idUser);
                      HandlSt.handlSt.setShared(idUser, true , 'User');
                      Provider.of<ECProvider>(context , listen: false).setUserEmail(userEmail);
                      Provider.of<ECProvider>(context , listen: false).setUserPassword(userPassword);
                      Provider.of<ECProvider>(context , listen: false).setIsAdmin(false);
                      Provider.of<ECProvider>(context , listen: false).setUserIdTest(idUser);
                      Provider.of<ECProvider>(context , listen: false).setUserName(userName);
                      Provider.of<ECProvider>(context , listen: false).setImgProfile('https://cdn.hipwallpaper.com/i/29/35/VzvAlh.jpg');
                      Provider.of<ECProvider>(context , listen: false).setImgCover('https://cdn.hipwallpaper.com/i/29/35/VzvAlh.jpg');
                     
                     Provider.of<ECProvider>(context , listen: false).setAddress('');
                      Provider.of<ECProvider>(context , listen: false).setPio('');
                      Provider.of<ECProvider>(context , listen: false).setMobileNum('');
                      Provider.of<ECProvider>(context , listen: false).setLatitude(0);
                      Provider.of<ECProvider>(context , listen: false).setLongitude(0);
                      
                      
                      Provider.of<ECProvider>(context , listen: false).addNewUserToFirbase();
                      ecProvider.setIndicator(false);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context)=>HomePage2()));
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
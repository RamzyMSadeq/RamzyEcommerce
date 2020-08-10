import 'package:e_commerce_project/Services/auth_service.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/ui/Screens/register_screen2.dart';
import 'package:e_commerce_project/features/user/ui/widgets/textFiels_Login_reg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class LogInScreens extends StatelessWidget {
   String email;
  String password;
  GlobalKey<FormState> formKey = GlobalKey();
  

  saveEmail(String value){
    this.email=value;   
  }
  savePassword(String value){
    this.password=value;   
  }
  validateEmail(String value){
    if(value==null || value ==''){
      return 'This Field is required';
    }
    else if(!isEmail(value)){
      return 'This Field is incorrect';
    }
  }

  validatePassword(String value){
    if(value==null || value ==''){
      return 'This Field is required';
    }
    else if(!isAlphanumeric(value)){
      return 'This Field is incorrect';
    }
  }
  submitForm(){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      return formKey.currentState.validate();

    }else{
      return false;
    }

  }

  @override
  Widget build(BuildContext context) {
    ECProvider ecProvider= Provider.of<ECProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: style.Colors.mainColor,

      body: Container(
        //margin: EdgeInsets.all(30),
        height: double.infinity,
        width: double.infinity,
        //height: 400,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
             // height: ScreenUtil().setHeight(300),
              child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: MyClippe(),
                      child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/2.6,
                      decoration: BoxDecoration(
                        
                        color: style.Colors.secondColor,
                        
                      ),
                      
                    ),
                          ),
            ClipPath(
              clipper: MyClippe2(),
                      child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/2.9,
                      decoration: BoxDecoration(
                      
                        color: style.Colors.mainColor,
                        
                      ),
                      
                    ),
                          ),
                          Container(
                            height: ScreenUtil().setHeight(300),
                            alignment: Alignment.center,
                            child: Image.asset(style.Image.urlLogo ))
                        ], 
                  )
            ),
            Container(
              height: ScreenUtil().setHeight(450),
              margin: EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                children: <Widget>[
                  SizedBox(height: ScreenUtil().setHeight(30),),
                  TextFiledLogInReg(hintName:'UserName or Email' , 
                  iconName: Icon(Icons.person_outline , size: 25,),
                   validationFun: validateEmail,
                   saveFormField: saveEmail,
            ),
                  SizedBox(height: ScreenUtil().setHeight(18),),
                  TextFiledLogInReg(hintName:'Password' ,
                   iconName: Icon(Icons.person_outline , size: 25,),
                   validationFun: validatePassword,
                   saveFormField: savePassword,
                   ),
                  SizedBox(height: ScreenUtil().setHeight(30),),
                  
                  Container(
                    width: 370,
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
                    child: FlatButton(onPressed: ()async{

                      if(submitForm()){
                        ecProvider.setIndicator(true);

                     FirebaseUser fiU = await AuthService.auth.logInWithEmail(email, password);
                    
                           AuthService.auth.redirect(context);
                           ecProvider.setIndicator(false);
                    
                                              
                      }
                    },
                    //color: style.Colors.mainColor,
                   // padding: EdgeInsets.symmetric(horizontal: 160, vertical: 23),

                     child: Text('Log In', style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                       color: style.Colors.titleColor
                      
                     ),),
                     
                     ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10),),

                  Text("OR" , style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black38
                  ),),
                  SizedBox(height: ScreenUtil().setHeight(10),),
                  Container(
                    width: 370,
                    height: 55,
                    
                    decoration: BoxDecoration(
                      //color: style.Colors.secondColor.withOpacity(.5),
                      borderRadius:BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(40),
                            ) ,
                            border: Border.all(color: Colors.grey, width: 2)
                      

                    ),
                    child: FlatButton(onPressed: (){},
                    //color: style.Colors.mainColor,
                   // padding: EdgeInsets.symmetric(horizontal: 160, vertical: 23),

                     child: Text('Log In With Google', style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                       color: style.Colors.secondColor
                      
                     ),),
                     
                     ),
                  ),
                  SizedBox(
                height: 2,
              ),

              Text('Forgot Password?',
                  style: GoogleFonts.poppins(
                      color: style.Colors.mainColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
                      SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Don’t have a account? ',
                      style: GoogleFonts.poppins(
                          color: style.Colors.hintColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (contex) => RegisterScreens2()));
                    },
                    child: Text(' Register',
                        style: GoogleFonts.poppins(
                            color: style.Colors.mainColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  
                ],
              )




                ],
              ),
                )
            ),
            ecProvider.indecator == true 
            ?
            CircularProgressIndicator(backgroundColor: Colors.red,)
            :
            Container()
          ],
        ),
      ),


      
    );
  }
}

   class MyClippe extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0,size.height-20 );
    path.quadraticBezierTo(size.width/4, size.height-40, size.width/2, size.height-10);
    path.quadraticBezierTo(size.width-(size.width/4), size.height+15, size.width, size.height-40);
    path.lineTo(size.width, 0.0);

     return path;
    }
  
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
  class MyClippe2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0,size.height-30 );
    path.quadraticBezierTo(size.width/4, size.height+20, size.width/2, size.height-10);
    path.quadraticBezierTo(size.width-(size.width/4), size.height-30, size.width, size.height-10);
    path.lineTo(size.width, 0.0);
     return path;
    }
  
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
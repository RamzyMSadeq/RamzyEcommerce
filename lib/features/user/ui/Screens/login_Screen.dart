import 'package:e_commerce_project/features/user/ui/Screens/HomePage.dart';
import 'package:e_commerce_project/features/user/ui/Screens/register_Screen.dart';
import 'package:e_commerce_project/features/user/ui/widgets/textFieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme.dart' as style;
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_validator/string_validator.dart';

class LogInScreen extends StatelessWidget {
  String email;
  String password;

  saveEmail(String value) {
    this.email = value;
  }

  savePassword(String value) {
    this.password = value;
  }

  validateEmail(String value) {
    if (value == null || value == '') {
      return 'This Field is required';
    } else if (!isEmail(value)) {
      return ' Oops! Your Email Is Not Correct ';
    }
  }

  validatePassword(String value) {
    if (value == null || value == '') {
      return 'This Field is required';
    } else if (!isNumeric(value)) {
      return ' Oops! Your Password Is Not Correct ';
    }
  }

  GlobalKey<FormState> formKey = GlobalKey();

  submitForm() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print(email);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: style.Colors.secondColor,
      backgroundColor: const Color(0xfff5f6f8),
      body: Container(
        margin: EdgeInsets.only(top: 150),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
// Start Logo Container

              Container(
                width: 72,
                height: 72,
                child: Image.asset(style.Image.urlLogo),
              ),

              SizedBox(
                height: 10,
              ),

//Start Title Container

              Container(
                //margin: EdgeInsets.only(left: ScreenUtil().setWidth(85) ),
                child: Text(
                  'Welcome to Ramzy App',
                  style: GoogleFonts.poppins(
                      color: style.Colors.titleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //Start subTitle Container

              Container(
                //margin: EdgeInsets.only(left: ScreenUtil().setWidth(85) ),
                child: Text(
                  'Sign in to continue',
                  style: GoogleFonts.poppins(
                      color: style.Colors.hintColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(
                height: 20,
              ),

// Start TextField Container
               Card(
                 child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.only(left: 15),
                      width: ScreenUtil().setWidth(343),
                      height: ScreenUtil().setHeight(48),
                      child: TextFieldWidget(
                        nameIcon: Icon(Icons.email),
                        validationFun: validateEmail,
                        saveFormField: saveEmail,
                        hintName: 'Your Email',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      //margin: EdgeInsets.only(left: 15),
                      width: ScreenUtil().setWidth(343),
                      height: ScreenUtil().setHeight(48),
                      child: TextFieldWidget(
                        nameIcon: Icon(Icons.lock_outline),
                        validationFun: validatePassword,
                        saveFormField: savePassword,
                        hintName: 'Password',
                      ),
                    ),
                  ],
                ),
              ),
               ),
              /*
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.only(left: 15),
                      width: ScreenUtil().setWidth(343),
                      height: ScreenUtil().setHeight(48),
                      child: TextFieldWidget(
                        nameIcon: Icon(Icons.email),
                        validationFun: validateEmail,
                        saveFormField: saveEmail,
                        hintName: 'Your Email',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      //margin: EdgeInsets.only(left: 15),
                      width: ScreenUtil().setWidth(343),
                      height: ScreenUtil().setHeight(48),
                      child: TextFieldWidget(
                        nameIcon: Icon(Icons.lock_outline),
                        validationFun: validatePassword,
                        saveFormField: savePassword,
                        hintName: 'Password',
                      ),
                    ),
                  ],
                ),
              ),
              */

              SizedBox(
                height: 20,
              ),

              GestureDetector(
               //() => submitForm(),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>HomePage()));

                },
                child: Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(343),
                  height: ScreenUtil().setHeight(57),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: style.Colors.mainColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 10,
                        color: Color.fromRGBO(64, 191, 255, 0.24)
                      )
                    ]
                  ),
                  child: Text("Sign In",
                      style: GoogleFonts.poppins(
                          color: style.Colors.secondColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Text('OR',
                  style: GoogleFonts.poppins(
                      color: style.Colors.hintColor,
                      //fontSize: 12 ,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),

              GestureDetector(
                onTap: () {},
                child: Container(
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(343),
                    height: ScreenUtil().setHeight(57),
                    //margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        //color: style.Colors.mainColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: style.Colors.hintColor),
                        /*
                        boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 5,
                        color: Color.fromRGBO(64, 191, 255, 0.24)
                      )
                    ]
                    */
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset('assets/images/googleIcon.png'),
                        Text("Login with Google",
                            style: GoogleFonts.poppins(
                                color: style.Colors.hintColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ],
                    )),
              ),
              SizedBox(
                height: 5,
              ),

              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(343),
                  height: ScreenUtil().setHeight(57),
                  //margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      //color: style.Colors.mainColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: style.Colors.hintColor),
                      /*
                      boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 5,
                        color: Color.fromRGBO(64, 191, 255, 0.24)
                      )
                    ]
                      */
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset('assets/images/Facebook.png'),
                      Text("Login with facebook",
                          style: GoogleFonts.poppins(
                              color: style.Colors.hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Text('Forgot Password?',
                  style: GoogleFonts.poppins(
                      color: style.Colors.mainColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),

              SizedBox(
                height: 20,
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
                          builder: (contex) => RegisterScreen()));
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
        ),
      ),
    );
  }
}

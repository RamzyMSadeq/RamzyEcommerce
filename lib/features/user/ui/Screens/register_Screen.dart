import 'package:e_commerce_project/features/user/ui/Screens/login_Screen.dart';
import 'package:e_commerce_project/features/user/ui/widgets/textFieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme.dart' as style;
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_validator/string_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  String name;

  String email;

  String password;

  String newPassword;

  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  saveName(String value) {
    this.name = value;
  }

  saveEmail(String value) {
    this.email = value;
  }

  savePassword(String value) {
    this.password = value;
  }

  saveNewPassword(String value) {
    this.newPassword = value;
  }

  validateName(String value) {
    if (value == null || value == '') {
      return 'This Field is required';
    } else if (!isAlpha(value)) {
      return ' Oops! Your Name Is Not Correct ';
    }
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

  validateNewPassword(String value) {
    if (value == null || value == '') {
      return 'This Field is required';
    } else if (!isNumeric(value)) {
      return ' Oops! Your New Password Is Not Correct ';
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

  GlobalKey<FormState> formKey2 = GlobalKey();

  submitForm2() {
    if (formKey2.currentState.validate()) {
      formKey2.currentState.save();
      print(email);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: style.Colors.secondColor,
        appBar: AppBar(
          bottom: TabBar(controller: tabController, tabs: [
            Tab(
              text: 'Customer',
            ),
            Tab(
              text: 'Trader',
            )
          ]),
        ),
        body: TabBarView(controller: tabController, children: [
          Container(
            margin: EdgeInsets.only(top: 100),
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
                      'Let’s Get Started',
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
                      'Create an new account',
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

                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          //margin: EdgeInsets.only(left: 15),
                          width: ScreenUtil().setWidth(343),
                          height: ScreenUtil().setHeight(48),
                          child: TextFieldWidget(
                            nameIcon: Icon(Icons.person_outline),
                            validationFun: validateName,
                            saveFormField: saveName,
                            hintName: 'Full Name',
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
                            nameIcon: Icon(Icons.lock_open),
                            validationFun: validatePassword,
                            saveFormField: savePassword,
                            hintName: 'Password',
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
                            nameIcon: Icon(Icons.lock_open),
                            validationFun: validateNewPassword,
                            saveFormField: saveNewPassword,
                            hintName: 'Password Again',
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  GestureDetector(
                    onTap: () => submitForm(),
                    child: Container(
                      alignment: Alignment.center,
                      width: ScreenUtil().setWidth(343),
                      height: ScreenUtil().setHeight(57),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: style.Colors.mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Sign Up",
                          style: GoogleFonts.poppins(
                              color: style.Colors.secondColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('have a account?  ',
                          style: GoogleFonts.poppins(
                              color: style.Colors.hintColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (contex) => LogInScreen()));
                        },
                        child: Text(' Sign In',
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
          Container(
            margin: EdgeInsets.only(top: 100),
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
                      'Let’s Get Started',
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
                      'Create an new account',
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

                  Form(
                    key: formKey2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          //margin: EdgeInsets.only(left: 15),
                          width: ScreenUtil().setWidth(343),
                          height: ScreenUtil().setHeight(48),
                          child: TextFieldWidget(
                            nameIcon: Icon(Icons.person_outline),
                            validationFun: validateName,
                            saveFormField: saveName,
                            hintName: 'Full Name',
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
                            nameIcon: Icon(Icons.lock_open),
                            validationFun: validatePassword,
                            saveFormField: savePassword,
                            hintName: 'Password',
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
                            nameIcon: Icon(Icons.lock_open),
                            validationFun: validateNewPassword,
                            saveFormField: saveNewPassword,
                            hintName: 'Password Again',
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  GestureDetector(
                    onTap: () => submitForm2(),
                    child: Container(
                      alignment: Alignment.center,
                      width: ScreenUtil().setWidth(343),
                      height: ScreenUtil().setHeight(57),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: style.Colors.mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Sign Up",
                          style: GoogleFonts.poppins(
                              color: style.Colors.secondColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('have a account?  ',
                          style: GoogleFonts.poppins(
                              color: style.Colors.hintColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (contex) => LogInScreen()));
                        },
                        child: Text(' Sign In',
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
        ]));
  }
}

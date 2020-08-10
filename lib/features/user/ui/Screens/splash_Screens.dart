import 'dart:async';

import 'package:e_commerce_project/features/admin/ui/dashboard/screens/home_dashboard.dart';
import 'package:e_commerce_project/features/user/Repositories/handler.dart';
import 'package:e_commerce_project/features/user/ui/Screens/homepage2.dart';
import 'package:e_commerce_project/features/user/ui/Screens/logIn_Screen2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

  @override
  void initState() {
    super.initState();
    startTime();
  }
  startTime()async{
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }
  route()async{
    bool isLogin= await HandlSt.handlSt.getSharedName();
  String role = await HandlSt.handlSt.getRole();
     
     isLogin == true && role == 'Admin' 
     ?
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context)=>HomeDashboard()))
      : isLogin == true && role == 'User'
      ? Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context)=>HomePage2()))
      :Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context)=>LogInScreens()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[600],
      
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            //stops: [0.5,1.0],
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF1F9F84) ,
               Color(0xFF1F9F84)])
        ),
              child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
                Container(
                 width: 300,
                 height: 200,
                 
                  child:Image.asset(style.Image.urlLogo)
                ),
             
              
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Text(
                "RStore",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
                
              ),
              Text(
                "APP",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
                
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 1,
             )
            ],
          ),

        ),
      ),
      
    );
  }
}
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password".toLowerCase()),
        elevation: 0,
        centerTitle: true,
        backgroundColor:style.Colors.mainColor ,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
             
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(370),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                     alignment: Alignment.topLeft,
                    child: Text('Old Password', style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,

              ),)),
                  Container(
                    
                    height: 50,   
                    child: TextField(
                      style: TextStyle(
                        fontSize: 15
                      ),
                      decoration: InputDecoration(
                        
                        filled: true,
                        fillColor: Color(0xFFECEFF6),
                        hintText: "•••••••••••••••••",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
             
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(370),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                     alignment: Alignment.topLeft,
                    child: Text('New Password', style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,

              ),)),
                  Container(
                    
                    height: 50,   
                    child: TextField(
                      style: TextStyle(
                        fontSize: 15
                      ),
                      decoration: InputDecoration(
                        
                        filled: true,
                        fillColor: Color(0xFFECEFF6),
                        hintText: "•••••••••••••••••",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
             
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(370),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                     alignment: Alignment.topLeft,
                    child: Text('New Password Again', style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,

              ),)),
                  Container(
                    
                    height: 50,   
                    child: TextField(
                      style: TextStyle(
                        fontSize: 15
                      ),
                      decoration: InputDecoration(
                        
                        filled: true,
                        fillColor: Color(0xFFECEFF6),
                        hintText: "•••••••••••••••••",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: ScreenUtil().setHeight(380), 
            ),
            Container(
                height: 60,
                width: 400,
                color: style.Colors.mainColor,
                child: FlatButton(
                  onPressed: (){},
                 child: Text("Save", style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: style.Colors.titleColor

              ),)
                 ),
              ),
          ],
        ),
      ),
      
    );
  }
}
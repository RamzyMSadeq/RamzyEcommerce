

import 'package:e_commerce_project/features/user/ui/Screens/homepage2.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 300 , bottom: 20),
              height: 100,
              width: 100,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: style.Colors.mainColor
              ),
              child: Center(
                child: Icon(Icons.check , color: style.Colors.titleColor, size: 60,),
              ),
            ),
            Text("successfully", style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              
            ),),
            SizedBox(height: 20,),
            RaisedButton(onPressed: (){
             Navigator.of(context).pushReplacement(MaterialPageRoute(
               builder: (context)=>HomePage2()));
            },
            child: Text("Back", style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: style.Colors.titleColor
              
            ),),
            padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
            color: style.Colors.secondColor,
            ),
            
          ],
        ),
      ),
      
    );
  }
}
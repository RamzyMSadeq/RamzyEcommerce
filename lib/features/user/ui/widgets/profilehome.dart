import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20 ),
            height: ScreenUtil().setHeight(238),
            width: ScreenUtil().setWidth(390),
            child: Card(
              child: Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('About Me' ,
                      style: GoogleFonts.poppins(
                                  color:Colors.grey,
                                      fontSize: 13,
                                       fontWeight: FontWeight.w500,

              ),),
                      subtitle: Text("Ramzy Sadeq , Computer Engineering , i love a black",
                      style: GoogleFonts.poppins(
                                  color:Colors.grey[700],
                                      fontSize: 12,
                                       fontWeight: FontWeight.w500,

              ),),
                      leading: Icon(Icons.person),
                    ),
                    ListTile(
                      title: Text('Email',
                      style: GoogleFonts.poppins(
                                  color:Colors.grey,
                                      fontSize: 13,
                                       fontWeight: FontWeight.w500,

              ),),
                      subtitle: Text("ramzySadeq@gmail.com",
                       style: GoogleFonts.poppins(
                                  color:Colors.grey[700],
                                      fontSize: 12,
                                       fontWeight: FontWeight.w500,

              ),),
                      leading: Icon(Icons.email),
                    ),
                    ListTile(
                      title: Text('telefone',
                      style: GoogleFonts.poppins(
                                  color:Colors.grey,
                                      fontSize: 13,
                                       fontWeight: FontWeight.w500,

              ),),
                      subtitle: Text("+972597765854",
                       style: GoogleFonts.poppins(
                                  color:Colors.grey[700],
                                      fontSize: 12,
                                       fontWeight: FontWeight.w500,

              ),),
                      leading: Icon(Icons.person),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10 ),
            height: ScreenUtil().setHeight(110),
            width: ScreenUtil().setWidth(390),
            child: Card(
              child: Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Location' ,
                      style: GoogleFonts.poppins(
                                  color:Colors.grey,
                                      fontSize: 13,
                                       fontWeight: FontWeight.w500,

              ),),
                      subtitle: Text(" Palestine - Gaza - Al-Quds Street",
                      style: GoogleFonts.poppins(
                                  color:Colors.grey[700],
                                      fontSize: 12,
                                       fontWeight: FontWeight.w500,

              ),),
                      leading: Icon(Icons.person),
                    ),
                  
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      
    );
  }
}
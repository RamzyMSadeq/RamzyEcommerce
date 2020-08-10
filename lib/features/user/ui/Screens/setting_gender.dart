import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingGender extends StatefulWidget {
  @override
  _SettingGenderState createState() => _SettingGenderState();
}

class _SettingGenderState extends State<SettingGender> {
  String dropdownValue = "Male";

  List<String> items = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Name".toLowerCase()),
        elevation: 0,
        centerTitle: true,
        backgroundColor: style.Colors.mainColor,
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
                      child: Text(
                        'First Name',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                   
                      height: 50,
                      width: 400,

                      color: Color(0xFFECEFF6),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: items.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                dropdownValue = value;
                                setState(() {});
                              }))),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(580),
            ),
            Container(
              height: 60,
              width: 400,
              color: style.Colors.mainColor,
              child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Save",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: style.Colors.titleColor),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

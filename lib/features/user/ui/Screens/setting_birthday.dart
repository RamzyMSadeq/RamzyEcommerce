import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingBirthday extends StatefulWidget {
  @override
  _SettingBirthdayState createState() => _SettingBirthdayState();
}

class _SettingBirthdayState extends State<SettingBirthday> {
  String dropdownValue = "Male";
   String dateT = "Not set";

  List<String> items = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Birthday".toLowerCase()),
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
                        'Your Birhday',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Container(
                    //padding: EdgeInsets.only(left: 20),
                   
                      height: 50,
                      width: 450,

                      child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(1950, 1, 1),
                      maxTime: DateTime(2020, 12, 31), onConfirm: (date) {
                    print('confirm $date');
                    dateT = '${date.year} - ${date.month} - ${date.day}';
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.teal,
                                ),
                                Text(
                                  " $dateT",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Change",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),

                      ),
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

import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;

class TextFiledLogInReg extends StatefulWidget {
  final String hintName;
  final Widget iconName;
  final Function validationFun;
  final Function saveFormField;
  TextFiledLogInReg(
      {this.hintName, this.iconName, this.validationFun, this.saveFormField});

  @override
  _TextFiledLogInRegState createState() => _TextFiledLogInRegState();
}

class _TextFiledLogInRegState extends State<TextFiledLogInReg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(40),
          ),
          ),
      child: Theme(
        data: ThemeData(
          primaryColor: style.Colors.mainColor,
          
          // primaryColorDark: Colors.red,
        ),
        child: TextFormField(
          validator: (value) => widget.validationFun(value),
          onSaved: (value) {
            widget.saveFormField(value);
            setState(() {});
            
          },
          style: TextStyle(height: .7, fontSize: 15),
          cursorColor: style.Colors.mainColor,
          decoration: InputDecoration(
            hintText: widget.hintName,
            prefixIcon: widget.iconName,
            focusColor: style.Colors.mainColor,
            hoverColor: style.Colors.mainColor,
            filled: true,
            fillColor: style.Colors.titleColor,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(40),
                )),
          ),
        ),
      ),
    );
  }
}

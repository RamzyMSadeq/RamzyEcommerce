import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme.dart' as style;
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final Icon nameIcon;
  final Function validationFun;
  final Function saveFormField;
  final String hintName;
  TextFieldWidget(
      {this.nameIcon, this.validationFun, this.saveFormField, this.hintName});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: style.Colors.mainColor,
      showCursor: false,
      onSaved: (value) => saveFormField(value),
      validator: (value) => validationFun(value),
      decoration: InputDecoration(
          prefixIcon: nameIcon,
          hintText: hintName,
          hintStyle: GoogleFonts.poppins(
              color: style.Colors.hintColor,
              fontSize: 12,
              fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none
          )),
    );
  }
}

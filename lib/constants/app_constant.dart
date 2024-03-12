import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor AnaRenk = Colors.deepOrange;
  static Color FormRenk = Colors.deepOrange.shade300;
  static const String BaslikText = 'Ortalama Hesapla';
  static final TextStyle BaslikStyle = GoogleFonts.quicksand(
    textStyle: TextStyle(
        color: AnaRenk, letterSpacing: .5, fontWeight: FontWeight.w800),
  );
  static BorderRadius borderRadius = BorderRadius.circular(20);

  static final TextStyle OrtalamaGosterBodyStyle = GoogleFonts.quicksand(
    textStyle: TextStyle(
        fontSize: 20,
        color: AnaRenk,
        letterSpacing: .5,
        fontWeight: FontWeight.w800),
  );

  static final TextStyle OrtalamaStyle = GoogleFonts.quicksand(
    textStyle: TextStyle(
        fontSize: 45,
        color: AnaRenk,
        letterSpacing: .5,
        fontWeight: FontWeight.w800),
  );

  static final DropDownPadding = EdgeInsets.symmetric(horizontal: 15,vertical: 5);
  static final DropDownMargin = EdgeInsets.only(top: 5,bottom: 5);
  static final IconbuttonStyle = ButtonStyle(iconSize: MaterialStateProperty.all(35) );
}
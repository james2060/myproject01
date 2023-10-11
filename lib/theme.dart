import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xff04754d  );
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: kPrimaryColor,
      elevation: 0.0,
    ),
    primaryColor: kPrimaryColor,
    textSelectionTheme: TextSelectionThemeData(cursorColor: kPrimaryColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1:
    GoogleFonts.nanumGothic(fontSize: 18.0, fontWeight: FontWeight.bold),
    headline2:
    GoogleFonts.nanumGothic(fontSize: 16.0, fontWeight: FontWeight.bold),
    subtitle1: GoogleFonts.nanumGothic(fontSize: 16.0),
    bodyText1: GoogleFonts.nanumGothic(fontSize: 15.0),
    bodyText2: GoogleFonts.nanumGothic(fontSize: 14.0),
  );
}
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

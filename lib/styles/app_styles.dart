import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Color.fromARGB(193, 234, 238, 241);
  static Color mainColor = Color(0xFF000633);
  static Color accentColor = Color(0xFF0065FF);

  //Card Colors

  static List<Color> cardColors = [
    Colors.white,
    Colors.red.shade100,
    Colors.green.shade100,
    Colors.yellow.shade100,
    Colors.brown.shade100,
    Colors.orange.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
  ];

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal);
  static TextStyle dateTitle =
      GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w500);
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final text;
  final size;
  final color;
  final textAlign;
  final fontWeight;

  const MyText({Key? key,required this.text,required this.size,this.color,this.textAlign,this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          fontSize: size,
          fontWeight: fontWeight == null ? FontWeight.w600 : fontWeight,
          color: color?? Colors.black,
      ),
    );
  }
}

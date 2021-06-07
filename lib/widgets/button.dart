import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget{

  final Function onpressed;
  final bool isBackground;
  final Color color;
  final Color textColor;
  String text;
  bool isActive;
  Button(this.text,{this.onpressed, this.isBackground, this.color, this.textColor, this.isActive});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: onpressed,
        child: Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: color),
            child: Text(text,
                style: GoogleFonts.ubuntu(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 15))
        )) ;
  }

}
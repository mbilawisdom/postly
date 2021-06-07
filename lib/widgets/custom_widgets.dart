
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomWidget{

  static Widget customAppBar(String title, {int titlefont, Color titleColor, final fontWeight}){
    return AppBar(
    backgroundColor: Colors.white,
    toolbarHeight: 60,
titleSpacing: 5,
elevation: 0,
bottom: PreferredSize(child: Divider(endIndent: 0,), preferredSize: Size(0,0), ),
title: Text(title, style: GoogleFonts.ubuntu(
color: titleColor ?? Colors.black54,
fontSize: titlefont ?? 18,
  fontWeight: fontWeight ?? FontWeight.normal
),),
);
}

}
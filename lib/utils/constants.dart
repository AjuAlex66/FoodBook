import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Color primaryColor = HexColor("#f17022");
Color white = Colors.white;
Color scaffoldColor = HexColor('#f7f7f7');
List<BoxShadow> shadow = <BoxShadow>[
  BoxShadow(
    color: Colors.black.withOpacity(0.1), // Shadow color with transparency
    offset: const Offset(0, 4), // Horizontal and vertical offset
    blurRadius: 10, // Softness of the shadow
    spreadRadius: 1, // Size of the shadow
  ),
];

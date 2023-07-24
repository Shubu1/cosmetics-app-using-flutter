import 'package:flutter/material.dart';

class AppTheme {
  static const bigText = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const bodyTheme =
      TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold);
  static const hotsaleTheme = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 19.0,
      fontStyle: FontStyle.normal,
      color: Colors.black);
  static const seeAllTextTheme = TextStyle(
      color: Colors.pink,
      fontWeight: FontWeight.bold,
      fontSize: 19.0,
      fontStyle: FontStyle.normal);
  static const productNameTheme =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
  static const descriptionTheme = TextStyle(
      color: Colors.blueGrey, fontSize: 13, fontWeight: FontWeight.bold);
  static const priceTheme =
      TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold);
}

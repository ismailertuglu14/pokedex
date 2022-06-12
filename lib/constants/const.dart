import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();
  static const String title = 'Pokedex';
  static TextStyle titleStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: _calculateFontSize(44),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle pokemonNameStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: _calculateFontSize(22),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle chipStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: _calculateFontSize(20),
    );
  }

  static _calculateFontSize(int size) {
    // Locale Font Size
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 0.5).sp;
    }
  }

  static TextStyle getPokeInfoTextStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: _calculateFontSize(16),
    );
  }

  static TextStyle getPokeLabelTextStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: _calculateFontSize(16),
      fontWeight: FontWeight.bold,
    );
  }
}

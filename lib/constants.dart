import 'package:flutter/material.dart';

var kButtonDecoration = BoxDecoration(
    color: Color(0xffe0dede),
    border: Border.all(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(24)));

var kBoxShadow = [
  BoxShadow(
      color: Colors.grey[600],
      offset: Offset(3.0, 3.0),
      blurRadius: 8.0,
      spreadRadius: 1.0),
  BoxShadow(
      color: Colors.white,
      offset: Offset(-3.0, -3.0),
      blurRadius: 8.0,
      spreadRadius: 1.0),
];

var kConsoleTextStyle = TextStyle(
  fontSize: 36.0,
  fontWeight: FontWeight.bold,
  color: Colors.grey[800],
);

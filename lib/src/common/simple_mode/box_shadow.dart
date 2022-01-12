import 'package:flutter/material.dart';

BoxShadow boxShadow1(Color lowerShadow) {
  return BoxShadow(
      color: lowerShadow,
      offset: const Offset(4.0, 4.0),
      blurRadius: 13.0,
      spreadRadius: 0.8);
}

BoxShadow boxShadow2(Color upperShadow) {
  return BoxShadow(
      color: upperShadow,
      offset: const Offset(-4.0, -4.0),
      blurRadius: 13.0,
      spreadRadius: 0.5);
}

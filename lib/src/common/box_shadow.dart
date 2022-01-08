import 'package:flutter/material.dart';

BoxShadow boxShadow1(Color lowerShadow) {
  return BoxShadow(
      color: lowerShadow,
      offset: const Offset(4.0, 4.0),
      blurRadius: 15.0,
      spreadRadius: 1.0);
}

BoxShadow boxShadow2(Color upperShadow) {
  return BoxShadow(
      color: upperShadow,
      offset: const Offset(-4.0, -4.0),
      blurRadius: 15.0,
      spreadRadius: 1.0);
}

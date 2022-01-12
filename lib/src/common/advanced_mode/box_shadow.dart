import 'package:flutter/material.dart';

BoxShadow boxShadow1(Color lowerShadow) {
  return BoxShadow(
      color: lowerShadow.withOpacity(0.9),
      offset: const Offset(4.0, 4.0),
      blurRadius: 14.0,
      spreadRadius: 1.0);
}

BoxShadow boxShadow2(Color upperShadow) {
  return BoxShadow(
      color: upperShadow.withOpacity(0.8),
      offset: const Offset(-3.0, -2.0),
      blurRadius: 10.0,
      spreadRadius: 0.5);
}

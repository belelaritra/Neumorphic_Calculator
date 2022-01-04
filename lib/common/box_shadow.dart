import 'package:flutter/material.dart';

BoxShadow boxShadow1() {
  return BoxShadow(
      color: Colors.blueGrey.shade200,
      offset: const Offset(4.0, 4.0),
      blurRadius: 15.0,
      spreadRadius: 1.0);
}

BoxShadow boxShadow2() {
  return const BoxShadow(
      color: Colors.white,
      offset: Offset(-4.0, -4.0),
      blurRadius: 15.0,
      spreadRadius: 1.0);
}

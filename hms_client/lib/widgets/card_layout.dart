import 'package:flutter/material.dart';

Card cardLayout(Container container) {
  return Card(
    color: Colors.white,
    elevation: 8.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    shadowColor: Colors.grey,
    child: Padding(padding: EdgeInsets.all(8.0), child: container),
  );
}

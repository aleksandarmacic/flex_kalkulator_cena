import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:price_calculator/labels.dart';

class HeadingContainer extends StatelessWidget {
  const HeadingContainer({required this.label});

    final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 915,
        color: Color(0xFF0E1037),
        child: Center(child: Text(label, style: TextStyle(color: Colors.white, fontSize: 24), textAlign: TextAlign.center),),
      ),
    );
  }
}

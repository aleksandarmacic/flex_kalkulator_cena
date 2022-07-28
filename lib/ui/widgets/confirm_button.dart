import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../labels.dart';

class ConfirmButton extends StatefulWidget {
  ConfirmButton() : super();

  @override
  State<ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      height: 50,
      width: 375,
      color: Color(0xFFFF2121),
      child: Padding(
        padding: EdgeInsets.only(left: 183.0, top: 11, bottom: 11, right: 38),
        child: Text(
          kCheckPrice,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    ));
  }
}

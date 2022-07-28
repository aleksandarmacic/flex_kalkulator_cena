import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageContainer extends StatefulWidget {
  const MessageContainer({Key? key}) : super(key: key);

  @override
  State<MessageContainer> createState() => _MessageContainerState();
}

class _MessageContainerState extends State<MessageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 900,
        height: 100,
        color: Colors.white70,
    );
  }
}

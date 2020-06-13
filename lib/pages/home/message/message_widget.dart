import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String userId;
  const MessageWidget({Key key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("消息中心"),
    );
  }
}
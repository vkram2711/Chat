import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(),
        Column(
          children: [
            Text('name'),
            Text('last message'),
          ],
        ),
        Text('time'),
      ],
    );
  }
}
import 'package:chat_app/widgets/chat.dart';
import 'package:flutter/cupertino.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return ChatWidget();
    });
  }
}
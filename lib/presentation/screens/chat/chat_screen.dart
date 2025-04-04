import 'package:flutter/material.dart';
import 'package:yes_no_app_4sa/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_4sa/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_4sa/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://static.vecteezy.com/system/resources/previews/007/225/199/original/robot-chat-bot-concept-illustration-vector.jpg'),
          ),
        ),
        title: Text('Chat Roboboy'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
              },
            )),

            // Caja de texto de mensajes
            MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}

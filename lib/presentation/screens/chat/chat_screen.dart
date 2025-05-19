import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_4sa/domain/entities/message.dart';
import 'package:yes_no_app_4sa/presentation/providers/chat_provider.dart';
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
    //Le pide que este pendiente de cambios
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              //Enlaza el controlador creado en ChatProvider
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                // Instancia que sabrá de quien es el mensaje
                final message = chatProvider.messageList[index];
                //Si es par es de ella y si no es impar es mio
                //index % 2 == 0
                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            )),

            // Caja de texto de mensajes
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}

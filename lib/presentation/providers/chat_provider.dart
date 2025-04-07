import 'package:flutter/material.dart';
import 'package:yes_no_app_4sa/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola, soy Emiliano', fromWho: FromWho.me),
    Message(text: 'Hola Emiliano, soy Roboboy', fromWho: FromWho.him),
  ];
}

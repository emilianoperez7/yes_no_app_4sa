import 'package:flutter/material.dart';
import 'package:yes_no_app_4sa/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  //Controlador que maneja la posicion del scroll
  final ScrollController chatScrollController = ScrollController();
  List<Message> messageList = [
    Message(text: 'Hola Salazar', fromWho: FromWho.me),
    Message(
        text: 'Por haberte ido te vas a especial directo',
        fromWho: FromWho.hers),
  ];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    //Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    print('Cantidad de mensajes: ${messageList.length}');

    //Notifica a provider que algo cambio
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    //Animacion
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      //offset: posicion del maximo scroll posible
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }
}

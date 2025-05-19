import 'package:flutter/material.dart';
import 'package:yes_no_app_4sa/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_4sa/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  //Controlador que maneja la posicion del scroll
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    //Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    print('Cantidad de mensajes: ${messageList.length}');

    //Detectar si el usuario hizo una pregunta
    if (text.endsWith('?')) {
      //Esperar la respuesta de ella
      herReply();
    }

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

  //Crear la respuesta de ella
  Future<void> herReply() async {
    //Obtener el mensaje de la petición HTTP
    final herMessage = await getYesNoAnswer.getAnswer();

    //Añadimos el mensaje de ella a la lista de mensajes
    messageList.add(herMessage);
    print('Cantidad de mensajes: ${messageList.length}');

    //Notifica a provider que algo cambio
    notifyListeners();

    //Mover el scroll hasta el último mensaje
    moveScrollToBottom();
  }
}

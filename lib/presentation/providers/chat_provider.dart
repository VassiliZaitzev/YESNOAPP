import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer ();

  List<Message> messagesList = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Cómo estás?", fromWho: FromWho.me),
    Message(text: "Bien y tú?", fromWho: FromWho.hers)
  ];
 


  Future<void> sendMessage(String text) async{
    if(text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    //NOTIFICA A TODOS LOS QUE ESTÁN ESCUCHANDO
    if(text.endsWith("?")){
      herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future <void> herReply() async{
    final herMessage = await getYesNoAnswer.getAnswer();
  }

  Future<void> moveScrollToBottom () async{
    await Future.delayed(const Duration(microseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(microseconds: 300), 
      curve: Curves.easeOut
    );
  }
}
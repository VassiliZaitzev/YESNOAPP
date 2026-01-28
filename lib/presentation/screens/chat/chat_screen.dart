import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://media.licdn.com/dms/image/v2/D4E03AQFlppGFzRzqHg/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1724767964773?e=2147483647&v=beta&t=YHs6XZLwvxyHTpfI4IDNXiLDh6JG8A5kzGkvTGjAO2c"),
          ),
        ),
        title: Text("Byron Moraga"),
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
                  return ( index % 2 == 0 ) ? const HerMessageBubble() : MyMessageBubble();
                
                },
              )
            ),
            //CAJA DE TEXTO
            const MessageFieldBox(),
            SizedBox(height: 2,)
          ],
        ),
      ),
    );
  }
}
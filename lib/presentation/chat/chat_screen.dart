import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://www.corazon.cl/wp-content/uploads/2023/01/305099859_185854427304264_2374985769651398326_n-546x390.jpg"),
          ),
        ),
        title: Text("Tio rene"),
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
                  return Text("Indice: ${index}");
                },
              )
            ),
            Text("Hola"),
            Text("Mundo")
          ],
        ),
      ),
    );
  }
}
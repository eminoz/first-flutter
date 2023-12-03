import 'package:first/models/todo.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  final List<Message> todo;
  const MessagesPage({super.key, required this.todo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mesajlar'),
        ),
        body: ListView.builder(
          itemCount: todo.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(todo[index].header),
              ),
              title: Text(todo[index].title),
              subtitle: Text(todo[index].description),
            );
          },
        ));
  }
}

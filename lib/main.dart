// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first/models/todo.dart';
import 'package:first/screens/messages.dart';
import 'package:first/screens/timeline.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Message> todos = [
    Message(
      "https://picsum.photos/250?image=2",
      'Mehmet emin ',
      'Flutter öğrenmek için bir uygulama yap.',
    ),
    Message(
      "https://picsum.photos/250?image=4",
      'Mehmet öz',
      'Flutter öğrenmek için bir uygulama yap.',
    ),
    Message(
      "https://picsum.photos/250?image=1",
      'emin öz',
      'Flutter öğrenmek için bir uygulama yap.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RouterLinksPage()));
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritesPage()));
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationPAge()));
              },
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MessagesPage(
                              todo: todos,
                            )));
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            IGTimeline(
              imagelink: 'https://picsum.photos/250?image=4',
            ),
            IGTimeline(
              imagelink: 'https://picsum.photos/250?image=13',
            ),
          ],
        ));
  }
}

class RouterLinksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Router Linkleri'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Burada router linkleri bulunabilir.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Ana sayfaya git butonuna tıklandı!');
              },
              child: Text('Başka Sayfaya Git'),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoriler'),
      ),
      body: Center(
        child: Text('Favoriler içeriği burada.'),
      ),
    );
  }
}

class NotificationPAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bildirimler'),
      ),
      body: Center(
        child: Text('Bildirimler içeriği burada.'),
      ),
    );
  }
}

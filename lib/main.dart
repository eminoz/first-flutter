import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final String username;
  final String email;

  User({required this.username, required this.email});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
    };
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Post Data Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Enter Username',
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Enter Email',
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final String username = usernameController.text;
                  final String email = emailController.text;
                  final User user = User(username: username, email: email);
                  postUser(user);
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> postUser(User user) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/createuser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      // Başarılı ise, oluşturulan kullanıcı hakkında bilgiyi yazdır
      print('User created successfully: ${response.body}');
    } else {
      // Başarısız ise, hata bilgisini yazdır
      print('Failed to create user. Error: ${response.statusCode}');
    }
  }
}

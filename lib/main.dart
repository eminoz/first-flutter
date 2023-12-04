import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'models/user.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<User> _userFuture;

  @override
  void initState() {
    super.initState();
    // initState içinde veriyi getiren fonksiyonu çağır
    _userFuture = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User Details'),
        ),
        body: FutureBuilder<User>(
          future: _userFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              print("Waiting for data");
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // Hata oluştuysa hata mesajını göster
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              // Veri geldiyse User bilgilerini göster
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('ID: ${snapshot.data!.id}'),
                  Text('Username: ${snapshot.data!.username}'),
                  Text('Email: ${snapshot.data!.email}'),
                ],
              );
            } else {
              // Beklenmeyen bir durum
              return Text('Unexpected error');
            }
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

Future<User> fetchUser() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/getuser'), headers: {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*",
    "token": "token"
  });

  if (response.statusCode == 200) {
    // Başarılı ise JSON'dan User objesine dönüştür
    return User.fromJson(jsonDecode(response.body));
  } else {
    // Başarısız ise hata fırlat
    throw Exception('Failed to load user');
  }
}

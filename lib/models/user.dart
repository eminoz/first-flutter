import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String username = '';
  String email = '';
  int age = 0;

  void setUser(String username, String email, int age) {
    this.username = username;
    this.email = email;
    this.age = age;
    notifyListeners();
  }
}

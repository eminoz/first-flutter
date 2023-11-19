// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:first/models/student.dart';
import 'package:flutter/material.dart';

//for ios cupertino
//for android material
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Başlık"),
      ),
      body: buildBody(),
    );
  }
}

Widget buildBody() {
  List<Student> students = [
    Student.withId(
        id: 1, name: "Ali", lastName: "Veli", grade: 100, status: "Aktif"),
    Student.withId(
        id: 2, name: "Ayşe", lastName: "Fatma", grade: 30, status: "Pasif"),
  ];

  return Column(
    children: <Widget>[
      Expanded(
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title:
                  Text(students[index].name + " " + students[index].lastName),
              subtitle: Text(students[index].getStatus),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"),
              ),
              trailing: buildStatusIcon(students[index].grade),
            );
          },
        ),
      )
    ],
  );
}

Widget buildStatusIcon(int grade) {
  return grade >= 50
      ? Icon(Icons.done)
      : grade >= 40
          ? Icon(Icons.album)
          : Icon(Icons.clear);
}

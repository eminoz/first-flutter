import 'package:first/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Örneği'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Kullanıcı Ayarla'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserSetter()),
              );
            },
          ),
          ListTile(
            title: Text('Kullanıcı Bilgileri'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserGetter()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class UserGetter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kullanıcı Bilgileri'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Kullanıcı Adı: ${Provider.of<UserModel>(context).username}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'E-Posta: ${Provider.of<UserModel>(context).email}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Yaş: ${Provider.of<UserModel>(context).age}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class UserSetter extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kullanıcı Ayarlama'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Kullanıcı Adı'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-Posta'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Yaş'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<UserModel>(context, listen: false).setUser(
                  _usernameController.text,
                  _emailController.text,
                  int.tryParse(_ageController.text) ?? 0,
                );
                Navigator.pop(context);
              },
              child: Text('Kullanıcı Ayarla'),
            ),
          ],
        ),
      ),
    );
  }
}

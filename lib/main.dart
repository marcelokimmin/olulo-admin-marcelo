import 'package:flutter/material.dart';
import 'package:olulo_admin/config/theme.dart';
import 'package:olulo_admin/screens/menu/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OLULO ADMIN',
      theme: theme(),
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => const MenuScreen(),
      },
    );
  }
}

/// main.dart
import 'package:flutter/material.dart';
import 'package:pandai_codice/pages/pagina_caricamento.dart';
import 'package:pandai_codice/pages/pagina_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PandAI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PaginaCaricamento(),
        '/login': (context) => const PaginaLogin(),
      },
    );
  }
}


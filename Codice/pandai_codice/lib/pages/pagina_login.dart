/// pagina_login.dart
import 'package:flutter/material.dart';

class PaginaLogin extends StatelessWidget {
  const PaginaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Benvenuto alla pagina di Login',
              style: TextStyle(fontSize: 18),
            ),
            // Aggiungi qui i tuoi campi di login
          ],
        ),
      ),
    );
  }
}

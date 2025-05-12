import 'package:flutter/material.dart';

class PaginaCaricamento extends StatefulWidget {
  const PaginaCaricamento({super.key});

  @override
  State<PaginaCaricamento> createState() => _PaginaCaricamentoState();
}

class _PaginaCaricamentoState extends State<PaginaCaricamento> {
  @override
  void initState() {
    super.initState();
    // Dopo 5 secondi, naviga alla pagina di login
    /*Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/sfondo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 246,
                  height: 259,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                   const Text(
                      'Pand',
                      style: TextStyle(
                        fontFamily: 'IrishGrover',
                        fontSize: 64,
                        color: Color(0xFF5A2D0C),
                      ),
                    ),
                    Image.asset(
                      'assets/immagineAI.png',
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

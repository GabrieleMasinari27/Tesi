import 'dart:async';

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
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  // Saturazione
  List<double> saturationMatrix(double saturation) {
    final double invSat = 1 - saturation;
    final double R = 0.213 * invSat;
    final double G = 0.715 * invSat;
    final double B = 0.072 * invSat;

    return <double>[
      R + saturation,
      G,
      B,
      0,
      0,
      R,
      G + saturation,
      B,
      0,
      0,
      R,
      G,
      B + saturation,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    const double saturationLevel =
        2; // 1.0 is normal, >1 increases saturation

    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.65,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/sfondo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.6,
                  child: ColorFiltered(
                    colorFilter:
                        ColorFilter.matrix(saturationMatrix(saturationLevel-0.5)),
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Pand',
                      style: TextStyle(
                        fontFamily: 'IrishGrover',
                        fontSize: screenWidth * 0.1,
                        color: const Color(0xFF5A2D0C),
                      ),
                    ),
                     // Reduced distance between text and image
                    ColorFiltered(
                      colorFilter:
                          ColorFilter.matrix(saturationMatrix(saturationLevel)),
                      child: Image.asset(
                        'assets/immagineAI.png',
                        width: screenWidth * 0.13,
                        height: screenWidth * 0.13,
                      ),
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

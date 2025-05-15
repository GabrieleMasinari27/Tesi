import 'package:flutter/material.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({super.key});

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  bool rememberMe = false;
  bool passwordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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

    const double saturationLevel = 2.5;
    // Responsive font sizes
    final double labelFontSize = screenWidth * 0.04; // 5% of screen width
    final double inputFontSize = screenWidth * 0.045;
    final double buttonFontSize = screenWidth * 0.05;

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
            child: SingleChildScrollView(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo
                    ColorFiltered(
                      colorFilter: ColorFilter.matrix(
                          saturationMatrix(saturationLevel - 1)),
                         child: Image.asset(
                        'assets/logo.png',
                         width: screenWidth * 0.5,
                        height: screenHeight * 0.6,
                        fit: BoxFit.contain,
                      ),
                    ),
                   
                    const SizedBox(height: 16), 
                        Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Pand',
                          style: TextStyle(
                            fontFamily: 'IrishGrover',
                            fontSize: screenWidth * 0.09,
                            color: const Color(0xFF5A2D0C),
                          ),
                        ),
                       ColorFiltered(
                      colorFilter: ColorFilter.matrix(
                          saturationMatrix(saturationLevel)),
                         child: Image.asset(
                          'assets/immagineAI.png',
                          width: screenWidth * 0.12,
                          height: screenWidth * 0.12,
                        ),
                       ),
                        const SizedBox(width: 4),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // Email TextField with floating label
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontFamily: 'IrishGrover',
                          fontSize: labelFontSize,
                          color: const Color(0xFF5A2D0C),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF5A2D0C)),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF5A2D0C)),
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'IrishGrover',
                        fontSize: inputFontSize,
                        color: const Color(0xFF5A2D0C),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Password TextField with floating label and visibility toggle
                    TextField(
                      controller: passwordController,
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontFamily: 'IrishGrover',
                          fontSize: labelFontSize,
                          color: const Color(0xFF5A2D0C),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF5A2D0C)),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF5A2D0C)),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xFF5A2D0C),
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'IrishGrover',
                        fontSize: inputFontSize,
                        color: const Color(0xFF5A2D0C),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Remember me and forgot password row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  rememberMe = !rememberMe;
                                });
                              },
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: rememberMe
                                      ? const Color(0xFF5A2D0C)
                                      : const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: rememberMe
                                    ? const Icon(
                                        Icons.check,
                                        size: 14,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Ricordati di me",
                              style: TextStyle(
                                fontFamily: 'IrishGrover',
                                fontSize: labelFontSize * 0.8,
                                color: const Color(0xFF5A2D0C),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle forgot password
                          },
                          child: Text(
                            "Dimenticato la password?",
                            style: TextStyle(
                              fontFamily: 'IrishGrover',
                              fontSize: labelFontSize * 0.75,
                              color: const Color(0xFF5A2D0C),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Accedi button
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(vertical: screenWidth * 0.05),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            "Accedi",
                            style: TextStyle(
                              fontFamily: 'IrishGrover',
                              fontSize: buttonFontSize,
                              color: const Color(0xFF5A2D0C),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Separator with "o" and lines
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            height: 1,
                            color: const Color(0xFF5A2D0C),
                          ),
                        ),
                        Text(
                          'o',
                          style: TextStyle(
                            fontFamily: 'IrishGrover',
                            fontSize: labelFontSize,
                            color: const Color(0xFF5A2D0C),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 8),
                            height: 1,
                            color: const Color(0xFF5A2D0C),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Registrati button
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(vertical: screenWidth * 0.05),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            "Registrati",
                            style: TextStyle(
                              fontFamily: 'IrishGrover',
                              fontSize: buttonFontSize,
                              color: const Color(0xFF5A2D0C),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

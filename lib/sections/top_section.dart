import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 900,
        minHeight: 700,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover, // Asegura que la imagen cubra todo
        ),
      ),
      child: Center(
        // Centra el contenido para evitar desbordes
        child: SingleChildScrollView(
          // Evita overflow vertical
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            constraints: BoxConstraints(
              maxWidth: size.width < 1200 ? size.width * 0.9 : 1200,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/logo_jacob.png",
                  width: size.width * 0.5 > 300
                      ? 300
                      : size.width * 0.5, 
                  // Máximo 300px
                ),
                const SizedBox(height: 20),
                GlassContent(size: size),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 689, maxHeight: 860),
                      child: Image.asset("assets/images/persona.png"),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GlassContent extends StatelessWidget {
  const GlassContent({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          constraints: BoxConstraints(
            maxWidth: 1110,
            maxHeight:
                size.height * 0.5, // Ajustamos a 50% para evitar overflow
          ),
          width: double.infinity,
          color: Colors.white.withOpacity(0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello there!',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.white),
              ),
              Text(
                'Jacob Avila',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              Text(
                'ISC Student | DEV in process',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:replate/components/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:replate/components/buttons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            painter: BackgroundPainter(),
          ),
          const Align(
            alignment: Alignment(0.2, -0.2), // Fine-tuned positioning
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/splash2.jpg"),
            ),
          ),
          const Align(
            alignment: Alignment(0.7, -0.7),
            child: CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage("assets/splash1.jpg"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 0, 14, 61),
                      Color.fromARGB(255, 133, 34, 208)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Text(
                    "Re-Plate",
                    style: GoogleFonts.ebGaramond(
                      letterSpacing: 2.0,
                      fontSize: 75,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white, // Needed for ShaderMask to work
                    ),
                  ),
                ),
                Text(
                  "Turning excess into access",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(219, 0, 0, 0),
                    // letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 20),
                MyButtons(
                  nav: () {
                    Navigator.of(context).pushNamed("/login");
                  },
                  text: "JOIN THE FLOCK",
                  buttonHeight: 64,
                  textSize: 21.5,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/knowmore");
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Know more about us?",
                        style: TextStyle(
                            fontSize: 15, color: Color.fromARGB(162, 0, 0, 0)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

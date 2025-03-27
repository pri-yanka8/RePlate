import 'package:flutter/material.dart';
import 'package:replate/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void showSigninPage() {
    Navigator.pushNamed(context, "/signin");
  }

  void _showKnowMorePage() {
    Navigator.pushNamed(context, "/knowmore");
  }

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
                GestureDetector(
                  onTap: showSigninPage,
                  child: Container(
                    width: double.infinity,
                    height: 63, // Full width
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0091DA), Color(0xFF3ABDFE)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "JOIN THE FLOCK",
                        style: GoogleFonts.poppins(
                            fontSize: 21.5,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _showKnowMorePage,
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

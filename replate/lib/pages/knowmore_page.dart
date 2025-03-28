import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:replate/components/backbutton.dart';

class KnowmorePage extends StatelessWidget {
  const KnowmorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CustomBackButton(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFC7CCFE), Color(0xFFECC2FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 42),
                  child: Center(
                    child: Image.asset(
                      "assets/knowmorepic.png",
                      height: 325,
                      width: 345,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Made with ❤️ and ⭐",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(219, 0, 0, 0),
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "At Re-Plate, we believe no meal should go to waste while others go hungry. Our mission is to bridge the gap between surplus food and those in need by creating an easy, reliable system for food donations. With eco-friendly food banks powered by solar energy, we aim to fight food waste and hunger simultaneously. Every donation matters, and together, we can ensure that perfectly good food reaches those who need it most. Let’s create a world where sharing food is as simple as rethinking leftovers and making sure no plate goes empty.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(219, 0, 0, 0),
                      letterSpacing: 2.0,
                      wordSpacing: 6.0,
                      height: 2.0),
                ),
                Lottie.asset(
                  'assets/dog.json',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

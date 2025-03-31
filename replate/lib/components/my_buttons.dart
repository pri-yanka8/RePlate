import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButtons extends StatelessWidget {
  const MyButtons(
      {super.key,
      required this.nav,
      this.text,
      this.buttonHeight,
      this.textSize});

  final VoidCallback nav;
  final String? text;
  final double? buttonHeight;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nav();
      },
      child: Container(
        width: double.infinity,
        height: buttonHeight, // Full width
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 236, 129, 255),
              Color.fromARGB(255, 75, 192, 251)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: Text(
            text!,
            style: GoogleFonts.poppins(
                fontSize: textSize,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 2.0),
          ),
        ),
      ),
    );
  }
}

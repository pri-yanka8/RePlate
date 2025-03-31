import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeImages extends StatelessWidget {
  const HomeImages({super.key, this.img, this.label});

  final String? img;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(img!, width: 183, height: 163.3),
          Positioned(
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                // color: Colors.black54,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                label!,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(221, 255, 255, 255),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

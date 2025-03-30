import 'package:flutter/material.dart';

class Googface extends StatelessWidget {
  const Googface({
    super.key,
    this.img,
  });
  final String? img;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(
            img!,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:replate/pages/knowmore_page.dart';
import 'package:replate/pages/login_page.dart';
import 'package:replate/pages/splash_screen.dart';
import 'package:replate/pages/signin_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/Signin': (context) => const SigninPage(),
        "/knowmore": (context) => const KnowmorePage(),
      },
      // home: SplashScreen(),  //---> as we are specifying "/" route. "home" SHOULD NOT be specified.
    ),
  );
}

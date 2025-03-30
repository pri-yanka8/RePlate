import 'package:flutter/material.dart';
import 'package:replate/pages/home_page.dart';
import 'package:replate/pages/knowmore_page.dart';
import 'package:replate/pages/login_page.dart';
import 'package:replate/pages/signup.dart';
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
        '/home': (context) => const HomePage(),
        "/signup": (context) => const SignupPage(),
      },
      // home: SplashScreen(),  //---> as we are specifying "/" route. "home" SHOULD NOT be specified.
    ),
  );
}

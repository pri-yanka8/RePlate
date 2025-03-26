import 'package:flutter/material.dart';
import 'package:replate/pages/splash_screen.dart';
import 'package:replate/pages/signin_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => SplashScreen(),
        '/signin': (context) => SigninPage(),
      },
      // home: SplashScreen(),  //---> as we are specifying "/" route. "home" SHOULD NOT be specified.  
    ),
  );
}

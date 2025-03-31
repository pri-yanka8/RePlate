// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:replate/components/backbutton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:replate/components/my_buttons.dart';
import 'package:replate/components/googface.dart';
import 'package:replate/components/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordobscure = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CustomBackButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/union.jpg",
              ),
              fit: BoxFit.cover, // Ensures the image covers the whole screen
            ),
            gradient: LinearGradient(
              colors: [Color(0xFFDADDFF), Color(0xFFF7E4FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SafeArea(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Welcome Back Hero!",
                    style: GoogleFonts.inter(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text("Enter your username and password"),
                  const SizedBox(height: 57),
                  CustomTextField(
                    controller: usernameController,
                    label: "Username",
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    controller: passwordController,
                    label: "Password",
                    isPassword: true,
                    obscureText: passwordobscure,
                    toggleObscure: () {
                      setState(() {
                        passwordobscure = !passwordobscure;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  MyButtons(
                    nav: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    text: 'Log In',
                    buttonHeight: 57,
                    textSize: 19.5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color.fromARGB(85, 0, 0, 0), // Line color
                          thickness: 0.8, // Line thickness
                          height: 80, // Space above and below the line
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text("or log in with",
                          style: TextStyle(
                            color: Color.fromARGB(181, 0, 0, 0),
                          )),
                      SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: Divider(
                          color: Color.fromARGB(85, 0, 0, 0),
                          thickness: 0.8,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Googface(
                          img: 'assets/google.jpg',
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Googface(img: 'assets/facebook.jpg')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color.fromARGB(255, 57, 71, 255),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

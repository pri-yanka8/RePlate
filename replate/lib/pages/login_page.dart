import 'package:flutter/material.dart';
import 'package:replate/components/backbutton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:replate/components/buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordobscure = true;

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
          image: DecorationImage(
            image: AssetImage(
              "assets/union.png",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
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
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 1),
                    ),
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        obscureText: passwordobscure,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.purple, width: 1),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          passwordobscure = !passwordobscure;
                        });
                      },
                      icon: Icon(passwordobscure
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ],
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
                  height: 30,
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
                    const SizedBox(
                      width: 7,
                    ),
                    Text("or sign in with",
                        style: TextStyle(
                          color: Color.fromARGB(181, 0, 0, 0),
                        )),
                    const SizedBox(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

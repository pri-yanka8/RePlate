import 'package:flutter/material.dart';
import 'package:replate/components/backbutton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:replate/components/my_buttons.dart';
import 'package:replate/components/custom_textfield.dart';
import 'package:flutter/services.dart';
import 'package:replate/components/googface.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController newUsernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  bool passwordobscure = true;

  // Error messages
  String? phoneError;
  String? usernameError;
  String? passwordError;

  @override
  void dispose() {
    newUsernameController.dispose();
    phoneController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  void validateAndSubmit() {
    print("validate and submit called!!");
    setState(() {
      phoneError = null;
      usernameError = null;
      passwordError = null;

      String phone = phoneController.text.trim();
      String username = newUsernameController.text.trim();
      String password = newPasswordController.text.trim();

      print("Phone: $phone");
      print("Username: $username");
      print("Password: $password");

      // Validation
      if (phone.isEmpty) {
        phoneError = "Phone number is required.";
        print("Error: Phone number is empty!");
      } else if (phone.length != 10) {
        phoneError = "Phone number must be exactly 10 digits.";
        print("Error: Phone number is not 10 digits!");
      }

      if (username.isEmpty) {
        usernameError = "Username is required.";
        print("Error: Username is empty!");
      } else if (username.length < 6) {
        usernameError = "Username must be at least 6 characters.";
        print("Error: Username is too short!");
      }

      if (password.isEmpty) {
        passwordError = "Password is required.";
        print("Error: Password is empty!");
      } else if (password.length < 6) {
        passwordError = "Password must be at least 6 characters.";
        print("Error: Password is too short!");
      }

      // If no errors, proceed
      if (phoneError == null &&
          usernameError == null &&
          passwordError == null) {
        print("All fields are valid! Proceeding to navigation...");
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_circle,
                        color: Colors.green, size: 40),
                    const SizedBox(height: 15),
                    Text(
                      "Hello, $username!",
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Your account has been created successfully.",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        );

        // Wait for 2 seconds, then navigate to home screen
        Future.delayed(const Duration(seconds: 2), () {
          if (context.mounted) {
            print("Navigating to home screen...");
            // Ensure context is still valid
            Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context, '/home');
          }
        });
      }
    });
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/union.png"),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              colors: [Color(0xFFDADDFF), Color(0xFFF7E4FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Create an account",
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 47),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple, width: 1),
                      ),
                      errorText: phoneError,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    controller: newUsernameController,
                    label: "Create a username",
                    errorText: usernameError,
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    controller: newPasswordController,
                    label: "Create a password",
                    isPassword: true,
                    obscureText: passwordobscure,
                    toggleObscure: () {
                      setState(() {
                        passwordobscure = !passwordobscure;
                      });
                    },
                    errorText: passwordError,
                  ),
                  const SizedBox(height: 45),
                  MyButtons(
                    nav: validateAndSubmit,
                    text: 'Create account',
                    buttonHeight: 57,
                    textSize: 19,
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color.fromARGB(85, 0, 0, 0),
                          thickness: 0.8,
                          height: 80,
                        ),
                      ),
                      SizedBox(width: 7),
                      Text(
                        "or continue with",
                        style: TextStyle(color: Color.fromARGB(181, 0, 0, 0)),
                      ),
                      SizedBox(width: 7),
                      Expanded(
                        child: Divider(
                          color: Color.fromARGB(85, 0, 0, 0),
                          thickness: 0.8,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                  const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Googface(img: 'assets/google.jpg'),
                        SizedBox(width: 35),
                        Googface(img: 'assets/facebook.jpg'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

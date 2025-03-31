// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:replate/components/custom_bottomnavbar.dart';
import 'package:replate/components/googface.dart';
import 'package:replate/components/home_images.dart';
// import 'package:replate/components/my_buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int _selectedIndex = 0;
  final List<TextEditingController> _dishControllers = [
    TextEditingController()
  ];
  bool isVeg = false;
  bool isNonVeg = false;
  int _selectedFreshness = 0;

  void _addNewTextField() {
    setState(() {
      _dishControllers.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xFFF3E8FF),

        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFDADDFF),
                Color(0xFFF7E4FF)
              ], // Light Purple Gradient
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Deliver now",
                      style: GoogleFonts.montserrat(
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 76, 76, 76),
                        // letterSpacing: 2.0,
                      ),
                    ),
                    Spacer(),
                    Googface(
                      img: 'assets/profilepic.jpg',
                    )
                  ],
                ),
                const SizedBox(height: 15),

                Container(
                  padding: EdgeInsets.only(
                      left: 15, right: 15, top: 25), // Reduced padding

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What’s in for your fellows today?",
                        style: GoogleFonts.poppins(
                          fontSize: 19.5,
                          // fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          // letterSpacing: 2.0,
                        ),
                      ),
                      const SizedBox(height: 12), // Reduced margin

                      // Dish Input Fields
                      Column(
                        children: _dishControllers
                            .asMap()
                            .entries
                            .map((entry) => Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 3), // Reduced spacing
                                  child: TextField(
                                    controller: entry.value,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      hintText: "Enter your dish",
                                      hintStyle: TextStyle(
                                          color: const Color.fromARGB(
                                              112, 0, 0, 0)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      suffixIcon: entry.key == 0
                                          ? GestureDetector(
                                              onTap: _addNewTextField,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  // color: Colors.grey[400],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Icon(Icons.add,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0)),
                                              ),
                                            )
                                          : null,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isNonVeg,
                                  onChanged: (val) {
                                    setState(() {
                                      isNonVeg = val!;
                                      if (isNonVeg) isVeg = false;
                                    });
                                  },
                                ),
                                const Text("Non-Veg"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isVeg,
                                  onChanged: (val) {
                                    setState(() {
                                      isVeg = val!;
                                      if (isVeg) isNonVeg = false;
                                    });
                                  },
                                ),
                                const Text("Veg"),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 4),

                      // Freshness (Radio Buttons)
                      Text(
                        "How long will it last?",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          // fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 90, 90, 90),
                          // letterSpacing: 2.0,
                        ),
                      ),
                      Column(
                        children: [
                          RadioListTile(
                            value: 1,
                            groupValue: _selectedFreshness,
                            onChanged: (val) {
                              setState(() {
                                _selectedFreshness = val!;
                              });
                            },
                            title: Text(
                              "To be eaten immediately (1 day)",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                // fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                // letterSpacing: 2.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.zero, // Reduces space
                            visualDensity:
                                VisualDensity.compact, // Makes it more compact
                          ),
                          RadioListTile(
                            value: 2,
                            groupValue: _selectedFreshness,
                            onChanged: (val) {
                              setState(() {
                                _selectedFreshness = val!;
                              });
                            },
                            title: Text(
                              "Can stay fresh (2 days)",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                // fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                // letterSpacing: 2.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.zero, // Reduces space
                            visualDensity:
                                VisualDensity.compact, // Makes it more compact
                          ),
                          RadioListTile(
                            value: 3,
                            groupValue: _selectedFreshness,
                            onChanged: (val) {
                              setState(() {
                                _selectedFreshness = val!;
                              });
                            },
                            title: Text(
                              "Fresh (3-4 days)",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                // fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                // letterSpacing: 2.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.zero, // Reduces space
                            visualDensity:
                                VisualDensity.compact, // Makes it more compact
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                // Transport Section (Text ON the Images)
                Text(
                  "Where does your plate fit the best?",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 38, 38, 38),
                    // letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 8),

                const Row(
                  children: [
                    HomeImages(
                        img: 'assets/cycle.png', label: "In my backpack"),
                    SizedBox(width: 8),
                    HomeImages(
                        img: 'assets/truck.png', label: "Needs a bigger seat")
                  ],
                ),

                const SizedBox(height: 12),

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 55, // Full width
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF3CBEFF), Color(0xFF93DBFF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Confirm plate",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          // fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 90, 90, 90),
                          // letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Donate Message
                Center(
                  child: Opacity(
                    opacity: 0.7,
                    child: const Text("Donate and help us grow ❤️",
                        style: TextStyle(color: Colors.black54)),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Bottom Navigation Bar (Now Visible)
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

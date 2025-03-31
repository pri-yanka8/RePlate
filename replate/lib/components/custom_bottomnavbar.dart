import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Bottom Navigation Bar
        Container(
          height: 91.4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 2,
                offset: const Offset(0, -7),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _navItem("assets/home_icon.png", 0),
              _navItem("assets/helpdesk.png", 1),
              const SizedBox(width: 50), // Space for the floating button
              _navItem("assets/recents.png", 2),
              _navItem("assets/profile_icon.png", 3),
            ],
          ),
        ),

        // Floating Location Button
        Positioned(
          bottom: 30, // Adjust height to make it "float"
          child: FloatingActionButton(
            onPressed: () => onTap(4),
            backgroundColor: const Color(0xFF3CBEFF),
            shape: const CircleBorder(),
            child: const Icon(Icons.search, color: Colors.white, size: 28),
          ),
        ),
      ],
    );
  }

  Widget _navItem(String assetPath, int index) {
    bool isSelected = selectedIndex == index; // Use widget.selectedIndex

    return GestureDetector(
      onTap: () {
        onTap(index); // Call parent function to update state
      },
      child: ColorFiltered(
        colorFilter: isSelected
            ? const ColorFilter.mode(
                Colors.blue, BlendMode.srcIn) // Selected color
            : const ColorFilter.mode(
                Colors.grey, BlendMode.srcIn), // Default color
        child: Opacity(
          opacity: isSelected ? 1.0 : 0.7, // Full opacity if selected
          child: Image.asset(
            assetPath,
            width: 50,
            height: 30,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => selectedIndex = index);
    debugPrint("🔽 Bottom nav tapped: $index");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00DBDE), Color(0xFF3CA55C)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navIcon(0, icon: Icons.home, label: "Home"),
          _navIcon(1, icon: Icons.bar_chart, label: "Stats"),
          _navCircleButton(),
          _navIcon(3, icon: Icons.history, label: "History"),
          _navIcon(4, icon: Icons.person, label: "Profile"),
        ],
      ),
    );
  }

  Widget _navIcon(int index, {required IconData icon, String? label}) {
    final isActive = selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isActive ? Colors.black : Colors.white, size: 24),
          if (label != null && isActive)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                label,
                style: const TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  Widget _navCircleButton() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: const Icon(Icons.add, color: Colors.black, size: 28),
    );
  }
}

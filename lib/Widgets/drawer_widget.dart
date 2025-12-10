import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function onDashboard;
  final Function onUsers;
  final Function onPatients;
  final Function onSetting;
  final Function onLogout;

  const CustomDrawer({
    super.key,
    required this.onDashboard,
    required this.onUsers,
    required this.onPatients,
    required this.onSetting,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.black12, width: 1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // MENU TITLE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Menu",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF026E92),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // DASHBOARD
            DrawerItem(
              icon: Icons.dashboard_outlined,
              text: "Dashboard",
              onTap: () => onDashboard(),
            ),

            DrawerItem(
              icon: Icons.group_outlined,
              text: "Users",
              onTap: () => onUsers(),
            ),

            DrawerItem(
              icon: Icons.person_pin_outlined,
              text: "Patients",
              onTap: () => onPatients(),
            ),

            DrawerItem(
              icon: Icons.settings_outlined,
              text: "Setting",
              onTap: () => onSetting(),
            ),

            const Spacer(),

            // LOG OUT BUTTON
            GestureDetector(
              onTap: () => onLogout(),
              child: Center(
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF026E92),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          children: [
            Icon(icon, size: 26, color: const Color(0xFF026E92)),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF026E92),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

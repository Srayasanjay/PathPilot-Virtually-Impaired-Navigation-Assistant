import 'package:flutter/material.dart';
import '../widgets/dashboard_card.dart';
import 'indoor_mode_screen.dart';
import 'outdoor_mode_screen.dart';
import 'memory_mode_screen.dart';
import 'navigation_mode_screen.dart';
import 'emergency_mode_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Centered Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(
                  'Home Screen',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            // Grid of cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                  children: [
                    DashboardCard(
                      icon: Icons.home,
                      label: 'Indoor Mode',
                      themeColor: Colors.blue,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const IndoorModeScreen()),
                      ),
                    ),
                    DashboardCard(
                      icon: Icons.park,
                      label: 'Outdoor Mode',
                      themeColor: Colors.green,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const OutdoorModeScreen()),
                      ),
                    ),
                    DashboardCard(
                      icon: Icons.memory,
                      label: 'Memory Mode',
                      themeColor: Colors.orange,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const MemoryModeScreen()),
                      ),
                    ),
                    DashboardCard(
                      icon: Icons.navigation,
                      label: 'Navigation Mode',
                      themeColor: Colors.purple,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const NavigationModeScreen()),
                      ),
                    ),
                    DashboardCard(
                      icon: Icons.medical_services,
                      label: 'Emergency Mode',
                      themeColor: Colors.red,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const EmergencyModeScreen()),
                      ),
                    ),
                    DashboardCard(
                      icon: Icons.settings,
                      label: 'Settings',
                      themeColor: Colors.grey,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SettingsScreen()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
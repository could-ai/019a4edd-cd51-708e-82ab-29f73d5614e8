import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/inventory_screen.dart';
import 'package:couldai_user_app/screens/pos_screen.dart';
import 'package:couldai_user_app/screens/reports_screen.dart';
import 'package:couldai_user_app/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POS & Inventory'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: <Widget>[
          _buildDashboardCard(context, 'Point of Sale', Icons.point_of_sale, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PosScreen()));
          }),
          _buildDashboardCard(context, 'Inventory', Icons.inventory, () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const InventoryScreen()));
          }),
          _buildDashboardCard(context, 'Reports', Icons.bar_chart, () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportsScreen()));
          }),
          _buildDashboardCard(context, 'Settings', Icons.settings, () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
          }),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50.0, color: Theme.of(context).primaryColor),
            const SizedBox(height: 16.0),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}

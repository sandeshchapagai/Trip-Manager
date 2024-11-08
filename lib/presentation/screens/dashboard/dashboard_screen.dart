import 'package:flutter/material.dart';

import '../main/components/bottom_navigation/bottom_navigation_screen.dart';
import 'components/dashboard_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: DashboardBody(),
      bottomNavigationBar: BottomNavigationScreen(),
    );
  }
}

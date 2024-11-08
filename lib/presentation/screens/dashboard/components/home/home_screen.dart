import 'package:flutter/material.dart';
import 'package:trip_manager/presentation/screens/dashboard/components/home/components/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}

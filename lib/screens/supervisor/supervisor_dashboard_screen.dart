import 'package:flutter/material.dart';

class SupervisorDashboardScreen extends StatelessWidget {
  const SupervisorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Supervisor Oversight')),
      body: const Center(child: Text('Supervisor Dashboard: Monitor Cases')),
    );
  }
}

import 'package:flutter/material.dart';

class LabDashboardScreen extends StatelessWidget {
  const LabDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forensic Laboratory')),
      body: const Center(child: Text('Lab Dashboard: Analyze Physical Evidence')),
    );
  }
}

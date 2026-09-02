import 'package:flutter/material.dart';

class ComplianceDashboardScreen extends StatelessWidget {
  const ComplianceDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compliance & Audit')),
      body: const Center(child: Text('Compliance Dashboard: View System Logs')),
    );
  }
}

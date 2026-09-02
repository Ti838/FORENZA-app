import 'package:flutter/material.dart';

class JudicialDashboardScreen extends StatelessWidget {
  const JudicialDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Judicial Chamber')),
      body: const Center(child: Text('Judicial Dashboard: Review Verified Evidence')),
    );
  }
}

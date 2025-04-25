import 'package:eapp/screens/admin/BaseScreen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Dashboard',
      body: Center(
        child: Text('Welcome to the Dashboard'),
      ),
    );
  }
}
import 'package:eapp/screens/admin/BaseScreen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Dashboard',
      body: Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Welcome to the Dashboard'))),
      ),
    );
  }
}
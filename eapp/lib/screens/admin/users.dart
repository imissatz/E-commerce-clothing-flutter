import 'package:eapp/screens/admin/BaseScreen.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Users',
      body: Center(
        child: Text('Welcome to the Users Page'),
      ),
    );
  }
}
import 'package:eapp/screens/admin/BaseScreen.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Order',
      body: Center(
        child: Text('Welcome to the Order Page'),
      
    )
    );
  }
}
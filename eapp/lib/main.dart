import 'package:eapp/models/product.dart';
import 'package:eapp/screens/user/cart.dart';
import 'package:flutter/material.dart';

import 'screens/user/splash_screen.dart';
import 'screens/user/homepage.dart';
import 'screens/user/product_details.dart';

import 'screens/admin/dashboard.dart';
import 'screens/admin/products.dart';
import 'screens/admin/order.dart';
import 'screens/admin/users.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furaha Centre',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {

        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/cart': (context) => const Cart(),
        '/admin/dashboard': (context) => const Dashboard(),
        '/admin/products': (context) => const Products(),
        '/admin/orders': (context) => const Order(),
        '/admin/users': (context) => const Users(),
      },
      onGenerateRoute: (settings){
          if(settings.name == '/product_details'){
            final product = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (context) => ProductDetails(product: product),
            );
          }
          return null; // Return null if no matching route is found
        }

    );
  }
}


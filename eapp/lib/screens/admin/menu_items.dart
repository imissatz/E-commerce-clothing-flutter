import 'package:flutter/material.dart';

final Map<String, Map<String, dynamic>> menuItems = {
  'Dashboard': {
    'icon': Icons.dashboard,
    'route': '/admin/dashboard',
  },
  'Products': {
    'icon': Icons.shopping_bag,
    'route': '/admin/products',
  },
  'Orders': {
    'icon': Icons.shopping_cart,
    'route': '/admin/orders',
  },
  'Users': {
    'icon': Icons.person,
    'route': '/admin/users',
  },
  'Analytics': {
    'icon': Icons.analytics,
    'route': '/analytics',
  },
  'Settings': {
    'icon': Icons.settings,
    'route': '/settings',
  },
};
import 'package:flutter/material.dart';

import 'package:eapp/screens/admin/menu_items.dart';

class BaseScreen extends StatefulWidget {
  final String title;
  final Widget body;


  const BaseScreen({super.key, required this.title, required this.body});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text('Menu')
              ),
          ...menuItems.entries.map((entry) => ListTile(
              leading: Icon(entry.value['icon'], color: Colors.amber),
              title: Text(entry.key),
              onTap: (){
                // Navigator.pop(context);
                Navigator.pushReplacementNamed(context, entry.value['route']);
              },
            ),
          ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: widget.body,
    );
  }
}


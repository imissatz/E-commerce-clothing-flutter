// ignore_for_file: unused_element

import 'package:eapp/models/product.dart';
import 'package:eapp/screens/user/cart.dart';
import 'package:eapp/server_handler.dart';
import 'package:flutter/material.dart';
import 'package:eapp/widget/container.dart';
import 'package:eapp/widget/categories.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture =
        serverHandler.getProducts(); // Fetch products from the server
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // If the data is loaded successfully, display the products
          List<Product> products = snapshot.data!;

          return Scaffold(
            backgroundColor: Colors.grey[50],
              body: CustomScrollView(slivers: [
                SliverAppBar(
                  backgroundColor: Colors.black87,
                  pinned: true,
                  expandedHeight: 180.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        const SizedBox(height: 50.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: "Search products...",
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(left: 10, top: 8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      'F U R A H A',
                      style: GoogleFonts.viaodaLibre(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
                  ),
                ),

                SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickyHeaderDelegate(
                    child: SizedBox(
                      height: 40.0,
                      child: Container(
                          padding: const EdgeInsets.only(left: 10.0),
                          color: Colors.grey[50],
                          child: const Categories()),
                    ),
                  ),
                ),

                // Products
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ProductContainer(
                          product: products[index]); // Your Product widget
                    },
                    childCount: products.length, // Number of items
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    mainAxisSpacing: 0.0, // Vertical spacing
                    crossAxisSpacing: 0.0, // Horizontal spacing
                    childAspectRatio:
                        0.75, // Controls the Shape of the product container
                  ),
                ),
              ]),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.black87,
                child: const Icon(Icons.shopping_cart, color: Colors.white70,),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Cart()));
                },
              ));
        });
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 40.0;

  @override
  double get minExtent => 40.0;

  @override
  bool shouldRebuild(_StickyHeaderDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}

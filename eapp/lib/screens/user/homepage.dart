import 'package:eapp/models/product.dart';
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
  void initState(){
    super.initState();
    _productsFuture = serverHandler.getProducts(); // Fetch products from the server
  }






  @override
  Widget build(BuildContext context) {

     return FutureBuilder<List <Product>>(
      future: _productsFuture, 
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }

        if(snapshot.hasError){
          return Center(child: Text('Error: ${snapshot.error}'));
        }
      // If the data is loaded successfully, display the products
        List<Product> products = snapshot.data!;
        
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              backgroundColor: Colors.deepPurple,
              pinned: true,
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    const SizedBox(height: 50.0),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10), ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: "Search products...",
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left:10, top: 8.0),
                          ),
                        ),),),
                  ],
                ),
              title: Text(
              'F U R A H A',
              style: GoogleFonts.viaodaLibre(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,  
              ),),
              centerTitle: true,
              ),
                            
          ),
          
        SliverToBoxAdapter(
          child: Column(
          children:[
            // Categories
            SizedBox(
              height: 45.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20, 
                itemBuilder: (context, index){
                return const Categories();
              }),
            ),
          ],
        ),),

        // Products
         SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                    return ProductContainer(product: products[index]); // Your Product widget
                },
                childCount: products.length, // Number of items
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                mainAxisSpacing: 10.0, // Vertical spacing
                crossAxisSpacing: 10.0, // Horizontal spacing
                childAspectRatio: 0.75, // Controls the Shape of the product container
              ),
            
            ),
          ]                  
      ),
        
    );
  }
  );
  }
}

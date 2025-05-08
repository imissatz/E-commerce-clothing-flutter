import 'package:eapp/models/cartProvider.dart';
// import 'package:eapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {

  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.items;



    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: items.isEmpty
       ? const Center(child: Text("Your cart is empty."))
       : ListView.builder(
            itemCount: items.length,
            padding: const EdgeInsets.all(10.0),
            itemBuilder: (context, index) {
              final product = items[index];
              return  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 4.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: ListTile(
                            leading: const Icon(Icons.shopping_cart, size: 50.0, color: Colors.deepPurple),
                            title: Text(product.name ?? 'Unknown Product', style: const TextStyle(fontSize: 20.0)),
                            subtitle: Text('TZS ${product.price}', style: const TextStyle(fontSize: 15.0)),
                            trailing: IconButton(
               icon:const Icon(Icons.delete), color: Colors.red,   
               onPressed: () => cart.removeFromCart(product),

               
               ),
              
                            ),
            )
            )
            );
            }
          ),
      
        );
  }
  }

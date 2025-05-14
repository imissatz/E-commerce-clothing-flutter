import 'package:eapp/models/cartProvider.dart';
// import 'package:eapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.items;

    final totalPrice = NumberFormat('#,###').format(cart.totalPrice);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      // List of products in the cart
      body: items.isEmpty
          ? const Center(child: Text("Your cart is empty."))
          : ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (context, index) {
                final product = items[index];
                final formattedPrice =
                    NumberFormat('#,###').format(product.price);

                return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                        elevation: 4.0,
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0)),
                          child: ListTile(
                            leading: const Icon(Icons.shopping_cart,
                                size: 50.0, color: Colors.deepPurple),
                            title: Text(product.name ?? 'Unknown Product',
                                style: const TextStyle(fontSize: 20.0)),
                            subtitle: Text('TZS $formattedPrice',
                                style: const TextStyle(fontSize: 15.0)),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () => cart.removeFromCart(product),
                            ),
                          ),
                        )));
              }),
      // Total price of items in the cart
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.deepPurple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Price',
                  style: TextStyle(color: Colors.white, fontSize: 10.0),
                ),
                Text(totalPrice,
                    style: const TextStyle(fontSize: 20.0, color: Colors.white))
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Handle checkout action
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Payment Done Successfully!'),
                ));
              },
              child: const Text('Pay Now',
                  style: TextStyle(fontSize: 20.0, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:eapp/models/cartProvider.dart';
import 'package:eapp/models/product.dart';
import 'package:eapp/screens/user/cart.dart';
// import 'package:eapp/screens/user/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat('#,###').format(product.price);
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 350.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  child: Image.network(
                    'http://10.0.2.2/backend_furaha/assets/${product.image}',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${product.name}".toUpperCase(),
                              style: const TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              'TZS ${formattedPrice.toString()}',
                              style: const TextStyle(fontSize: 20.0),
                            )
                          ]),
                      Text('Product Description: ${product.description}'),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: [
                            Row(children: [
                              const Text(
                                'COLOR',
                              ),
                              const SizedBox(
                                width: 25.0,
                              ),
                              SizedBox(
                                width: 97,
                                height: 57,
                                child: DropdownButtonFormField<String>(
                                  value: 'BLACK',
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5.0),
                                  items: ['BLACK', 'WHITE', 'RED'].map((color) {
                                    return DropdownMenuItem<String>(
                                      value: color,
                                      child: Text(
                                        color,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    // Handle color selection
                                  },
                                ),
                              )
                            ]),
                            const Spacer(),
                            const Row(
                              children: [
                                Text(
                                  'SIZE',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 25.0,
                                ),
                                Text(
                                  'XXL',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                                )
                              ),
                              icon: const Icon(Icons.shopping_bag, color: Colors.white,),
                              label: const Text('BUY NOW', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .addToCart(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Added to Cart")));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )
                              ),  
                              icon: const Icon(Icons.shopping_cart, color: Colors.white,),
                              label: const Text('ADD CART', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),

              //Product feedback
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Product Feedback',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // User Profile Picture
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/nopfp.jpg'),
                                    radius: 18,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Username',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Text('2d ago',
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),

                              Text(
                                '★ ★ ★ ★ ☆',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.amber),
                              ),
                              Text(
                                  'Lorem Ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.'),
                              SizedBox(
                                height: 8.0,
                              ),

                              // Like and Comment Count
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.thumb_up,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text('12')
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(Icons.comment, color: Colors.grey),
                                ],
                              ),
                              Text('Comment Count')
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),

              // Similar Products
              const Text('Similar Products'),
              const SizedBox(
                height: 5.0,
              ),

              const Column(
                children: [
                  Text('Product 1'),
                  Text('Product 2'),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Cart()));
          },
        ));
  }
}

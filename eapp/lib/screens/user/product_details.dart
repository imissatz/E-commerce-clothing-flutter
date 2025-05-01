import 'package:eapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat('#,###').format(product.price);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 350.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network('http://10.0.2.2/backend_furaha/assets/${product.image}',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
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
                   children:  [

                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("${product.name}".toUpperCase(), style: const TextStyle(fontSize: 20.0),),
                                Text('TZS ${formattedPrice.toString()}', style: const TextStyle(fontSize: 20.0),)]
                                ),
                     Text('Product Description: ${product.description}'),
                            
                    const SizedBox(
                    height: 20
                     ),
                            
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_bag
                      ),
                      label: const Text('Buy Now'),
                    ),
                  ),
                            
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart
                      ),
                       label: const Text('Add Cart'),
                    ),
                  ),
                ],
                ),

                            
                  ],),
              ),
              
            ),
            const SizedBox(height: 10.0),

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
                        style: TextStyle(fontSize: 16.0, 
                                         fontWeight: FontWeight.bold)), 
                        SizedBox(height: 10.0,),
                        Card(
                          child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(),),)
                      ],
                    ),),

                    
                )
           
          ],
        ),
      )
    );
  }
}
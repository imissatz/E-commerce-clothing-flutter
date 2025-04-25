import 'package:eapp/models/product.dart';
import 'package:eapp/screens/user/product_details.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final Product product; 

  const ProductContainer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
  
          return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(product: product)));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(10.0),
          ),  
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Expanded(
                  child: Image.network('http://10.0.2.2/backend_furaha/assets/${product.image}', fit: BoxFit.cover),
                        ),
                const SizedBox(height: 5.0,),
                Text(product.price?.toString() ?? 'Unknown Price'),
                Text(product.name ?? 'Unknown Product'),
                const Text('★ ★ ★ ★ ☆'),
              ],
            ),
          ),),
      ),
    );}
}
     
    
    
    
    

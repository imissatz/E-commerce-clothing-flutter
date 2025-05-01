import 'package:eapp/models/product.dart';
import 'package:eapp/screens/user/product_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductContainer extends StatelessWidget {
  final Product product; 
  

  const ProductContainer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat('#,###').format(product.price);
  
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(product: product)));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
            ),  
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      // Replace with your image URL
                    child: Image.network('http://10.0.2.2/backend_furaha/assets/${product.image}', 
                    fit: BoxFit.cover, 
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50),)),
                    ),
                        
                const SizedBox(height: 5.0,),
                
                      Text("TZS ${formattedPrice.toString()}"),
                      Text(product.name ?? 'Unknown Product'),
                      const Text('★ ★ ★ ★ ☆', style:TextStyle(fontSize: 13.0, fontWeight: FontWeight.w100),),
                
              ],
            ),
          ),),
      ),
    );}
}
     
    
    
    
    

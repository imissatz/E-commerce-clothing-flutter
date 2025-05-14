import 'package:eapp/models/cartProvider.dart';
import 'package:eapp/models/product.dart';
import 'package:eapp/screens/user/product_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductContainer extends StatelessWidget {
  final Product product;

  const ProductContainer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat('#,###').format(product.price);

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(product: product)));
      },
      child: Card(
        color: Colors.grey[50],
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Image.network(
                      'http://10.0.2.2/backend_furaha/assets/${product.image}',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 50),
                    )),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text("TZS ${formattedPrice.toString()}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.name ?? 'Unknown Product'),
                IconButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added to Cart")));
                  },
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black87,
                    size: 30.0,
                  ),
                  tooltip: 'Add to cart',
                ),
              ],
            ),
            const Text(
              '★ ★ ★ ★ ☆',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w100),
            ),
          ],
        ),
      ),
    );
  }
}

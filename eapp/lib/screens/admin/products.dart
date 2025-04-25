import 'package:eapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:eapp/screens/admin/BaseScreen.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eapp/server_handler.dart';
// import 'package:http/http.dart' as http;
import 'dart:io';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => ProductState();
}

class ProductState extends State<Products> {

  final _formGlobalKey = GlobalKey<FormState>();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productDescriptionController = TextEditingController();
  final TextEditingController productImageController = TextEditingController();

  File? image;

  final List<Map<String, String>> _products =[];

   // Function to pick an image from the gallery or camera
  Future<String> _pickImage() async {
  
   final picker = ImagePicker();
  XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
  
  if (pickedFile != null) {
    setState(() {
       image = File(pickedFile.path); // Local file path
       productImageController.text = image!.path; // Set the path in the controller
    });
   
  }
  return "There was an error picking the image";
      
  }

  void _addProduct() async{
    if (_formGlobalKey.currentState!.validate()) {
      final success = await serverHandler.addProduct(
        name: productNameController.text,
        price: productPriceController.text,
        description: productDescriptionController.text,
        image: image,); // Call the addProduct function from serverHandler

        if (success) {
          loadProducts(); // Reload the products after adding a new one
          productNameController.clear();
          productPriceController.clear();
          productDescriptionController.clear();
          productImageController.clear();
          setState(() {
            image = null; // Reset the image after adding the product
          });

        }
        else {
          // Handle the error case if needed
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to add product')),
          );
        }
        
      }
    }
  

  Future<void> loadProducts() async {
    try{

      List<Product> products = await serverHandler.getProducts();
      setState((){
        _products.clear();
        for (Product product in products){
          _products.add({
            'id' : product.id.toString(),
            'productName' : product.name ?? '',
            'productPrice' : product.price?.toString() ?? '',
            'productDescription' : product.description ?? '',
            'productImage' : product.image ?? '',
          });
        }

      });

    }
    catch (e){
      throw Exception('Failed to load products: $e');
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Products',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
        
              // Form to add product
              Container(
                width: 320,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Form(
                  key: _formGlobalKey,
              
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,             
              
                    children: [
                      
                      TextFormField(
                        controller: productNameController,
                        decoration: const InputDecoration(
                          labelText: 'Product Name',
                        ),
                      ),
              
                      TextFormField(
                        controller: productPriceController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly],
                        decoration: const InputDecoration(
                          labelText: 'Product Price',
                        ),
                      ),
              
                      TextFormField(
                        controller: productDescriptionController,
                        decoration: const InputDecoration(
                          labelText: 'Product Description',
                        ),
                        
                      ),
              
                      TextFormField(
                        controller: productImageController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Product Image',
                          suffixIcon: IconButton(icon: const Icon(Icons.image),
                           onPressed: _pickImage,), 
                        ),
                      ),
              
                      const SizedBox(height: 20,),
              
                      FilledButton(
                        onPressed: _addProduct,
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.blue[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ), 
                        ), 
                        child: const Text('Add Product')
                      ),
              
                      FilledButton(
                        onPressed: loadProducts,
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.blue[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ), 
                        ), 
                        child: const Text('Load Products')
                      ),
                  
                      
                
                  ],)
                ),
              ),
        
              const SizedBox(height: 20,),
        
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                      
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  
                  child: DataTable(
                    border: TableBorder.all(),
                    columns: const[
                      DataColumn(label: Text('Product Name')),
                      DataColumn(label: Text('Product Price')),
                      DataColumn(label: Text('Product Description')),
                      DataColumn(label: Text('Product Image')),
                      DataColumn(label: Text(' '))
                    ],
                     rows: _products
                     .map((product) => DataRow(cells: [
                    DataCell( Text(product['productName']!)),
                    DataCell( Text(product['productPrice']!)), 
                    DataCell( Text(product['productDescription']!)),
                    DataCell( Text(product['productImage']!)),
                    DataCell( 
                      IconButton(
                        icon: const Icon(Icons.delete,color: Colors.red,),
                        onPressed: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Confirm Delete'),
                              content: const Text('Are you sure you want to delete this product?'),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                                TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Delete')),
                              ],)
                          );

                          if (confirm == true) {
                            final success = await serverHandler.deleteProduct(product['id']!);
                            if (success) {
                              loadProducts(); // Reload the products after deletion
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Product deleted successfully')),
                              );  
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Failed to delete product')),
                              );      
                            }
                          }


                        },
                      ))
                     ]),
                     ).toList() ,) ,),
              )
            ],
          ),
          
        ),
      ),
    );
  }
  
}



import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:eapp/models/product.dart';
// import 'package:eapp/screens/admin/products.dart';
import 'package:http/http.dart' as http;

class ServerHandler {
    final String _baseUrl = 'http://10.0.2.2/backend_furaha/api';


    // Getting products from the server
    Future <List <Product>> getProducts() async {
        try{
            List <Product> products =[];

            http.Response response = await http.get(Uri.parse('$_baseUrl/get/products.php'));

            // print('Response body: ${response.body}');

            if(response.statusCode == 200){

                List productsList = (jsonDecode(response.body))['products']; 

                for (Map m in productsList){
                    products.add(Product.fromJson(m));
                }

                //Reverse the List to ensure the latest product appears first 
                products.sort((a,b) => b.id!.compareTo(a.id!));

                return products;
            } 
            else{

                throw Exception('Failed to load products: ${response.statusCode}');
            }
        }catch (e) {
            // If an error occurs, throw an exception.
            throw Exception('Failed to load products: $e');
        }

    }


// Function to add a product to the server

    Future<bool> addProduct({
      required String name,
      required String price,
      required String description,
      File? image,
    }) async {
  const String baseUrl = 'http://10.0.2.2/backend_furaha/api/seller/add.php';

  try {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl));

    // Attach form fields
    request.fields['name'] = name;
    request.fields['price'] = price;
    request.fields['description'] =  description;

    // Attach image file if available
    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
    }

    // Send the request
    var response = await request.send();
    var responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print('Product added successfully: $responseBody');
    } else {
      // ignore: avoid_print
      print('Failed to add product: ${response.statusCode} - $responseBody');
      return false;
    }
  } catch (e) {
    // ignore: avoid_print
    print("Error adding product: $e");
    return false;
  }

  return true;
}

Future<bool> deleteProduct(String id) async {
  try {
    final response = await http.post(
      Uri.parse('$_baseUrl/seller/delete.php'),
      body: {'id': id},
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result['success'] == true;
    } else {
      return false;
    }
  } catch (e) {
    print('Delete failed: $e');
    return false;
  }
}


    
}
var serverHandler = ServerHandler();
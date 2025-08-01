import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_application_8/app/modules/product/models/product.dart';

class ProductService {
  final String url = "https://fakestoreapi.com/products";

  Future<List<ProductModel>> fetchProducts() async {
    try {
      print("Start Fetching Products");

      final response = await http.get(Uri.parse(url));

      print("After fetching Products");

      print("The Response is: $response");
      print("The status code is: ${response.statusCode}");
      print("The response body: ${response.body}");

      if (response.statusCode == 200) {
        List data = json.decode(response.body);

        print("The data is: $data");

        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print("The err msg is: $e");
      throw e;
    }
  }
}

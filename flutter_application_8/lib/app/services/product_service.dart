import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_application_8/app/modules/product/models/product.dart';

class ProductService {
  final String url = "https://fakestoreapi.com/products";

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);

      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      debugPrint("The status code is: ${response.statusCode}");
      debugPrint("The response body: ${response.body}");

      throw Exception("Failed to load data");
    }
  }
}

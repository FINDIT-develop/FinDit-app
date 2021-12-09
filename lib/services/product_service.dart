import 'dart:convert';

import 'package:get/get.dart';
import 'package:FinDit/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService extends GetConnect {
  static ProductService get to => Get.find();

  Future<List<Product>> fetchAllProduct() async {
    final response =
        await http.get(Uri.parse('http://moic-findit.site/app/products'));

    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['result'].cast<Map<String, dynamic>>();
      return parsed.map<Product>((json) => Product.fromMap(json)).toList();
    } else {
      Get.snackbar(
        'Error',
        'Something went wrong while fetching the data',
      );
      throw Exception('Failed to load.');
    }
  }

  Future<Product> fetchProductInfo(String productId) async {
    final response = await http
        .get(Uri.parse("http://moic-findit.site/app/products/" + productId));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body)['result'];

      return Product.fromMap(parsed);
    } else {
      Get.snackbar(
        'Error',
        'Something went wrong while fetching the data',
      );
      throw Exception('Failed to load.');
    }
  }
}

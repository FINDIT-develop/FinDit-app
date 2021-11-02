import 'package:get/get.dart';
import 'package:FinDit/models/product.dart';

class ProductService extends GetConnect {
  static ProductService get to => Get.find();
  // static var client = http.Client();
  @override
  void onInit() {
    httpClient.baseUrl =
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";
    super.onInit();
  }

  Future<List<Product>?> fetchProducts() async {
    String url = "";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      if (response.body != null) {
        return productFromJson(response.body);
      }
    }
  }
  
  
}

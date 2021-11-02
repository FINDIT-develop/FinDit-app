import 'package:FinDit/models/product.dart';
import 'package:FinDit/repository/base_client.dart';
import 'package:FinDit/repository/product_service.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

class ProductController extends GetxController with BaseController {
  var isLoading = true.obs;
  var productList = RxList<Product>().obs;

  void getProducts() async {
    showLoading('Fetching data');
    var response = await BaseClient()
        .get("https://makeup-api.herokuapp.com/",
            "api/v1/products.json?brand=maybelline")
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    print(response);
  }

  // void fetchProducts() async {
  //   try {
  //     isLoading(true);
  //     var products = await ProductService.to.fetchProducts();
  //     if (products != null) {
  //       productList.value = products as RxList<Product>;
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}

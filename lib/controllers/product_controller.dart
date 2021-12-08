import 'package:FinDit/models/product.dart';
import 'package:FinDit/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();
  var isLoading = true.obs;
  var products = <Product>[].obs;
  @override
  void onInit() {
    loadproducts();
    super.onInit();
  }

  void loadproducts() async {
    try {
      isLoading(true);
      var productList = await ProductService.to.fetchAllProduct();
      products.assignAll(productList);
    } finally {
      isLoading(false);
    }
  }
}

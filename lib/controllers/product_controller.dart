import 'package:FinDit/models/product.dart';
import 'package:FinDit/repository/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = RxList<Product>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ProductService.to.fetchProducts();
      if (products != null) {
        productList.value = products as RxList<Product>;
      }
    } finally {
      isLoading(false);
    }
  }
}

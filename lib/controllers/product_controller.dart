import 'package:FinDit/models/product.dart';
import 'package:FinDit/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();
  var isLoading = true.obs;
  var productList = <Product>[].obs;
  var product = Product();

  @override
  void onInit() {
    loadproducts();
    
    super.onInit();
  }

  void loadproducts() async {
    try {
      isLoading(true);
      var products = await ProductService.to.fetchAllProduct();
      productList.assignAll(products);
    } finally {
      isLoading(false);
    }
  }

  void loadProductById(String productId) async {
    try {
      isLoading(true);

      product = (await ProductService.to.fetchProductInfo(productId));
    } finally {
      isLoading(false);
    }
  }
}

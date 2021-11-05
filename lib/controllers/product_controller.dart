import 'package:FinDit/models/product.dart';
import 'package:FinDit/repository/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = RxList<Product>().obs;
}

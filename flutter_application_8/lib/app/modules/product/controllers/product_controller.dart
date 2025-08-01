import 'package:flutter_application_8/app/modules/product/models/product.dart';
import 'package:flutter_application_8/app/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productsList = <ProductModel>[].obs;

  final ProductService productService;

  var isLoading = true.obs;

  var errMsg = ''.obs;

  ProductController({required this.productService});

  @override
  void onInit() {
    super.onInit();

    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      errMsg('');

      List<ProductModel> products = await productService.fetchProducts();

      productsList.assignAll(products);
    } catch (e) {
      errMsg("Failed to load data");
    } finally {
      isLoading(false);
    }
  }
}

import 'package:flutter_shop/features/product/domain/entities/product.dart';
import 'package:flutter_shop/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_shop/core/config/app_config.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    // LOGIC: Simulate network delay for realistic UX
    await Future.delayed(const Duration(milliseconds: 800));
    return dummyProducts;
  }

  @override
  Future<Product?> getProductById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return dummyProducts.cast<Product?>().firstWhere(
      (p) => p?.id == id,
      orElse: () => null,
    );
  }
}

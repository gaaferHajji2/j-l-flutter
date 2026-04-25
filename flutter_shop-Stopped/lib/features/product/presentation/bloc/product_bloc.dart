// STATE MANAGEMENT: Product BLoC
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/features/product/domain/repositories/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<LoadProductDetail>(_onLoadProductDetail);
  }

  // LOGIC + ERROR HANDLING
  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final products = await repository.getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError('Failed to load products: $e'));
    }
  }

  Future<void> _onLoadProductDetail(
    LoadProductDetail event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final product = await repository.getProductById(event.id);
      if (product != null) {
        emit(ProductDetailLoaded(product));
      } else {
        emit(ProductError('Product not found'));
      }
    } catch (e) {
      emit(ProductError('Failed to load product detail: $e'));
    }
  }
}

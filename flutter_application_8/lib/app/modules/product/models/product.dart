class ProductModel {
  final String name;
  final double price;

  ProductModel({required this.name, required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson(ProductModel product) {
    return {"name": product.name, "price": product.price.toString()};
  }
}

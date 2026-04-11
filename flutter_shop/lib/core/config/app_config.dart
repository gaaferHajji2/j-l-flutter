// Dummy data initialization (senior: centralized config)
import 'package:uuid/uuid.dart';
import '../../features/product/domain/entities/product.dart';
import '../../features/order/domain/entities/order.dart';
import '../../features/cart/domain/entities/cart_item.dart';

const uuid = Uuid();

final List<Product> dummyProducts = [
  Product(
    id: uuid.v4(),
    name: 'Wireless Headphones',
    description: 'Premium noise-cancelling headphones with 30h battery',
    price: 99.99,
    imageUrl: 'https://picsum.photos/id/20/300/300',
    category: 'Electronics',
  ),
  Product(
    id: uuid.v4(),
    name: 'Smart Watch',
    description: 'Fitness tracker with heart rate monitor',
    price: 149.99,
    imageUrl: 'https://picsum.photos/id/29/300/300',
    category: 'Electronics',
  ),
  Product(
    id: uuid.v4(),
    name: 'Denim Jacket',
    description: 'Classic blue denim jacket, premium quality',
    price: 59.99,
    imageUrl: 'https://picsum.photos/id/201/300/300',
    category: 'Fashion',
  ),
  Product(
    id: uuid.v4(),
    name: 'Running Shoes',
    description: 'Lightweight breathable running shoes',
    price: 89.99,
    imageUrl: 'https://picsum.photos/id/160/300/300',
    category: 'Fashion',
  ),
  Product(
    id: uuid.v4(),
    name: 'Coffee Maker',
    description: 'Automatic drip coffee machine, 12 cups',
    price: 79.99,
    imageUrl: 'https://picsum.photos/id/180/300/300',
    category: 'Home',
  ),
];

final List<Order> dummyOrders = [
  Order(
    id: uuid.v4(),
    items: [CartItem(product: dummyProducts[0], quantity: 1)],
    total: 99.99,
    date: DateTime.now().subtract(const Duration(days: 5)),
    status: 'delivered',
  ),
  Order(
    id: uuid.v4(),
    items: [CartItem(product: dummyProducts[2], quantity: 2)],
    total: 119.98,
    date: DateTime.now().subtract(const Duration(days: 12)),
    status: 'shipped',
  ),
];

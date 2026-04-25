import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:flutter_shop/features/cart/domain/entities/cart_item.dart';

class Order extends Equatable {
  final String id;
  final List<CartItem> items;
  final double total;
  final DateTime date;
  final String status; // 'pending', 'shipped', 'delivered'

  const Order({
    required this.id,
    required this.items,
    required this.total,
    required this.date,
    this.status = 'pending',
  });

  String get formattedDate => DateFormat('MMM dd, yyyy').format(date);

  @override
  List<Object?> get props => [id, items, total, date, status];
}

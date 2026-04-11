import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {}

class LoadProductDetail extends ProductEvent {
  final String id;
  const LoadProductDetail(this.id);
  @override
  List<Object> get props => [id];
}

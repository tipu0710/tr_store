import 'package:equatable/equatable.dart';

abstract class ProductsDetailsEvent extends Equatable {
  const ProductsDetailsEvent();

  @override
  List<Object?> get props => [];
}

class OnProductsDetailsGet extends ProductsDetailsEvent {
  final int id;
  const OnProductsDetailsGet(this.id);
  @override
  List<Object?> get props => [id];
}

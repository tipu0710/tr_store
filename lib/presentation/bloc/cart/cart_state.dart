import 'package:equatable/equatable.dart';
import 'package:tr_store/domain/entities/product.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<ProductEntity> result;

  const CartLoaded(this.result);

  @override
  List<Object?> get props => [result];
}


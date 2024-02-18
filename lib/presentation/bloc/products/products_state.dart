import 'package:equatable/equatable.dart';
import 'package:tr_store/domain/entities/product.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsEmpty extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductEntity> result;

  const ProductsLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

class ProductsLoadFailure extends ProductsState {
  final String message;

  const ProductsLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
import 'package:equatable/equatable.dart';
import 'package:tr_store/domain/entities/product.dart';

abstract class ProductsDetailsState extends Equatable {
  const ProductsDetailsState();

  @override
  List<Object?> get props => [];
}

class ProductsDetailsLoading extends ProductsDetailsState {}

class ProductsDetailsLoaded extends ProductsDetailsState {
  final ProductEntity result;

  const ProductsDetailsLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

class ProductsDetailsLoadFailure extends ProductsDetailsState {
  final String message;

  const ProductsDetailsLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}

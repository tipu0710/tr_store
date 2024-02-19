import 'package:equatable/equatable.dart';
import 'package:tr_store/domain/entities/product.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class OnCartGet extends CartEvent {
  const OnCartGet();
  @override
  List<Object?> get props => [];
}

class OnCartAdd extends CartEvent {
  final ProductEntity productEntity;
  const OnCartAdd(this.productEntity);
  @override
  List<Object?> get props => [productEntity];
}

class OnCartUpdate extends CartEvent {
  final ProductEntity productEntity;
  const OnCartUpdate(this.productEntity);
  @override
  List<Object?> get props => [productEntity];
}

class OnCartDelete extends CartEvent {
  final int primaryId;
  const OnCartDelete(this.primaryId);
  @override
  List<Object?> get props => [primaryId];
}

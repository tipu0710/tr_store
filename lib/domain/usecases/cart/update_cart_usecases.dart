import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/domain/entities/product.dart';
import 'package:tr_store/domain/repositories/cart/update_cart_repository.dart';

class UpdateCartUsecases {
  final UpdateCartRepository updateCartRepository;

  UpdateCartUsecases({required this.updateCartRepository});

  Future<Either<Failure, ProductEntity>> execute(ProductEntity productEntity) {
    return updateCartRepository.updateCartProduct(productEntity);
  }
}

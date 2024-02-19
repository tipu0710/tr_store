import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/domain/entities/product.dart';
import 'package:tr_store/domain/repositories/cart/add_to_cart_repositories.dart';

class AddToCartUseCase {
  final AddToCartRepository addToCartRepository;

  AddToCartUseCase({required this.addToCartRepository});

  Future<Either<Failure, ProductEntity>> execute(ProductEntity productEntity) {
    return addToCartRepository.addToCart(productEntity);
  }
}

import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/domain/entities/product.dart';
import 'package:tr_store/domain/repositories/cart/all_cart_product_repository.dart';

class AllCartProductUseCase {
  final AllCartProductRepository allCartProductRepository;

  AllCartProductUseCase({required this.allCartProductRepository});

  Future<Either<Failure, List<ProductEntity>>> execute() {
    return allCartProductRepository.getAllCartProduct();
  }
}

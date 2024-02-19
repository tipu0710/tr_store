import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/domain/entities/product.dart';

abstract class AddToCartRepository {
  Future<Either<Failure, ProductEntity>> addToCart(ProductEntity productEntity);
}

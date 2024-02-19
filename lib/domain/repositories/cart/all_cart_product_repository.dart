import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/domain/entities/product.dart';

abstract class AllCartProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllCartProduct();
}

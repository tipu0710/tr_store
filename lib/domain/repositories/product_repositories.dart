import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/domain/entities/product.dart';

abstract class ProductRepositories {
  Future<Either<Failure, List<ProductEntity>>> getProduct();
}

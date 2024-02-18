import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/domain/entities/product.dart';
import 'package:tr_store/domain/repositories/product_repositories.dart';

class GetProductListUseCase {
  final ProductRepositories productRepositories;

  GetProductListUseCase({required this.productRepositories});

  Future<Either<Failure, List<ProductEntity>>> execute() {
    return productRepositories.getProducts();
  }
}

import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/domain/entities/product.dart';
import 'package:tr_store/domain/repositories/product_details_repository.dart';

class GetProductDetailsUseCase {
  final ProductDetailsRepository productDetailsRepository;

  GetProductDetailsUseCase({required this.productDetailsRepository});

  Future<Either<Failure, ProductEntity>> execute(int id) {
    return productDetailsRepository.getProductDetails(id);
  }
}

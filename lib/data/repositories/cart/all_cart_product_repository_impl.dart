import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/exception.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/data/data_sources/cart/all_cart_product_local_data_source.dart';
import 'package:tr_store/domain/entities/product.dart';
import 'package:tr_store/domain/repositories/cart/all_cart_product_repository.dart';

class AllCartProductRepositoryImpl implements AllCartProductRepository {
  final AllCartProductLocalDataSource allCartProductDataSource;
  const AllCartProductRepositoryImpl({required this.allCartProductDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllCartProduct() async {
    try {
      var list = await allCartProductDataSource.getAllProduct();
      var result = list.map((productModel) {
        return ProductEntity(
          id: productModel.id,
          content: productModel.content,
          image: productModel.image,
          slug: productModel.slug,
          thumbnail: productModel.thumbnail,
          title: productModel.title,
          url: productModel.url,
          userId: productModel.userId,
          count: productModel.count,
        );
      }).toList();
      return Right(result);
    } on LocalDatabaseException {
      return const Left(DatabaseFailure(errorAddTask));
    }
  }
}

const String errorAddTask = 'Error When add new product';

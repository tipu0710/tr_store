import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/exception.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/data/data_sources/cart/cart_update_local_data_source.dart';
import 'package:tr_store/data/models/product_model.dart';
import 'package:tr_store/domain/entities/product.dart';
import 'package:tr_store/domain/repositories/cart/update_cart_repository.dart';

class UpdateCartRepositoryImpl implements UpdateCartRepository {
  final CartUpdateLocalDataSource cartUpdateLocalDataSource;
  const UpdateCartRepositoryImpl({required this.cartUpdateLocalDataSource});

  @override
  Future<Either<Failure, ProductEntity>> updateCartProduct(
      ProductEntity productEntity) async {
    try {
      final productModel = ProductModel(
        id: productEntity.id,
        content: productEntity.content,
        image: productEntity.image,
        slug: productEntity.slug,
        thumbnail: productEntity.thumbnail,
        title: productEntity.title,
        url: productEntity.url,
        userId: productEntity.userId,
      );
      final taskModel =
          await cartUpdateLocalDataSource.updateCart(productModel);
      return Right(taskModel.toEntity());
    } on LocalDatabaseException {
      return const Left(DatabaseFailure(errorAddTask));
    }
  }
}

const String errorAddTask = 'Error When add new product';

import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/exception.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/data/data_sources/cart/add_to_cart_local_data_source.dart';
import 'package:tr_store/data/models/product_model.dart';
import 'package:tr_store/domain/entities/product.dart';
import 'package:tr_store/domain/repositories/cart/add_to_cart_repositories.dart';

class AddToCartRepositoryImpl implements AddToCartRepository {
  final AddToCartLocalDataSource addToCartLocalDataSource;
  const AddToCartRepositoryImpl({required this.addToCartLocalDataSource});

  @override
  Future<Either<Failure, ProductEntity>> addToCart(ProductEntity productEntity) async {
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
        count: productEntity.count,
      );
      final taskModel = await addToCartLocalDataSource.addToCart(productModel);
      return Right(taskModel.toEntity());
    } on LocalDatabaseException {
      return const Left(DatabaseFailure(errorAddTask));
    }
  }
}

const String errorAddTask = 'Error When add new product';

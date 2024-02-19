import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/exception.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/data/data_sources/cart/delete_cart_local_data_source.dart';
import 'package:tr_store/domain/repositories/cart/delete_cart_repository.dart';

class DeleteCartRepositoryImpl implements DeleteCartRepository {
  final CartDeleteLocalDataSource cartDeleteLocalDataSource;
  const DeleteCartRepositoryImpl({required this.cartDeleteLocalDataSource});

  @override
  Future<Either<Failure, bool>> deleteCartProduct(String slug) async {
    try {
      final count = await cartDeleteLocalDataSource.deleteCart(slug);
      return Right(count);
    } on LocalDatabaseException {
      return const Left(DatabaseFailure(errorAddTask));
    }
  }
}

const String errorAddTask = 'Error When add new product';

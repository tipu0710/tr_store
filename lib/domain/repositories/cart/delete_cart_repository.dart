import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/failure.dart';

abstract class DeleteCartRepository {
  Future<Either<Failure, bool>> deleteCartProduct(int primaryId);
}

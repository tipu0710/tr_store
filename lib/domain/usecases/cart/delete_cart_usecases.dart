import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/domain/repositories/cart/delete_cart_repository.dart';

class DeleteCartUsecases {
  final DeleteCartRepository deleteCartRepository;

  DeleteCartUsecases({required this.deleteCartRepository});

  Future<Either<Failure, bool>> execute(String slug) {
    return deleteCartRepository.deleteCartProduct(slug);
  }
}

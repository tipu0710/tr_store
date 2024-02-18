import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/exception.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/data/data_sources/product_details_remote_data_source.dart';
import 'package:tr_store/domain/entities/product.dart';
import 'package:tr_store/domain/repositories/product_details_repository.dart';

class ProductDetailsRepositoryImpl extends ProductDetailsRepository {
  final ProductDetailsRemoteDataSources productRemoteDataSources;

  ProductDetailsRepositoryImpl({required this.productRemoteDataSources});

  @override
  Future<Either<Failure, ProductEntity>> getProductDetails(int id) async {
    try {
      final result = await productRemoteDataSources.getProductDetails(id);
      return Right<Failure, ProductEntity>(result);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}

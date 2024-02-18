import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tr_store/core/error/exception.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/data/data_sources/product_remote_data_source.dart';
import 'package:tr_store/domain/entities/product.dart';
import 'package:tr_store/domain/repositories/product_repositories.dart';

class ProductRepositoryImpl extends ProductRepositories {
  final ProductRemoteDataSources productRemoteDataSources;

  ProductRepositoryImpl({required this.productRemoteDataSources});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final productModelList = await productRemoteDataSources.getProducts();
      var result = productModelList
          .map(
            (e) => e.toEntity(),
          )
          .toList();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}

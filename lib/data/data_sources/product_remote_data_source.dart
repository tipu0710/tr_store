import 'package:dio/dio.dart';
import 'package:tr_store/core/constants/constants.dart';
import 'package:tr_store/core/error/exception.dart';
import 'package:tr_store/data/models/product_model.dart';

abstract class ProductRemoteDataSources {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourcesImpl extends ProductRemoteDataSources {
  final Dio dio;

  ProductRemoteDataSourcesImpl({required this.dio});

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get(Url.getProducts());

    if (response.statusCode == 200) {
      Iterable list = response.data;
      return list.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }
}

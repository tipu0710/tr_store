import 'package:dio/dio.dart';
import 'package:tr_store/core/constants/constants.dart';
import 'package:tr_store/core/error/exception.dart';
import 'package:tr_store/data/models/product_model.dart';

abstract class ProductDetailsRemoteDataSources {
  Future<ProductModel> getProductDetails(int id);
}

class ProductDetailsRemoteDataSourceImpl
    extends ProductDetailsRemoteDataSources {
  final Dio dio;

  ProductDetailsRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProductModel> getProductDetails(int id) async {
    final response = await dio.get(Url.getProductDetails(id));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}

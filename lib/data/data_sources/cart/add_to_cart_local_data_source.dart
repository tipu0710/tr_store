import 'package:tr_store/core/error/exception.dart';
import 'package:tr_store/data/models/product_model.dart';
import 'package:tr_store/service/db.dart';

abstract class AddToCartLocalDataSource {
  Future<ProductModel> addToCart(ProductModel productModel);
}

class AddToCartLocalDataSourceImpl implements AddToCartLocalDataSource {
  final DbService _dbService;
  const AddToCartLocalDataSourceImpl(this._dbService);

  @override
  Future<ProductModel> addToCart(ProductModel productModel) async {
    try {
      await _dbService.createItem(productModel);
      return productModel;
    } catch (e) {
      throw LocalDatabaseException();
    }
  }
}

import 'package:tr_store/core/error/exception.dart';
import 'package:tr_store/data/models/product_model.dart';
import 'package:tr_store/service/db.dart';

abstract class CartUpdateLocalDataSource {
  Future<ProductModel> updateCart(ProductModel productModel);
}

class UpdateCartLocalDataSourceImpl implements CartUpdateLocalDataSource {
  final DbService _dbService;
  const UpdateCartLocalDataSourceImpl(this._dbService);

  @override
  Future<ProductModel> updateCart(ProductModel productModel) async {
    try {
      await _dbService.updateItem(productModel);
      return productModel;
    } catch (e) {
      throw LocalDatabaseException();
    }
  }
}

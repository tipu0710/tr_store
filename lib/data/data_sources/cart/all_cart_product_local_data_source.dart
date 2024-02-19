import 'package:tr_store/core/error/exception.dart';
import 'package:tr_store/data/models/product_model.dart';
import 'package:tr_store/service/db.dart';

abstract class AllCartProductLocalDataSource {
  Future<List<ProductModel>> getAllProduct();
}

class AllCartProductLocalDataSourceImpl
    implements AllCartProductLocalDataSource {
  final DbService _dbService;
  const AllCartProductLocalDataSourceImpl(this._dbService);

  @override
  Future<List<ProductModel>> getAllProduct() async {
    try {
      return await _dbService.allItems();
    } catch (e) {
      throw LocalDatabaseException();
    }
  }
}

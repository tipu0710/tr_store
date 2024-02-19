import 'package:tr_store/core/error/exception.dart';
import 'package:tr_store/service/db.dart';

abstract class CartDeleteLocalDataSource {
  Future<bool> deleteCart(int primaryId);
}

class CartDeleteLocalDataSourceImpl implements CartDeleteLocalDataSource {
  final DbService _dbService;
  const CartDeleteLocalDataSourceImpl(this._dbService);

  @override
  Future<bool> deleteCart(int primaryId) async {
    try {
      var count = await _dbService.deleteItem(primaryId);
      return count > 0;
    } catch (e) {
      throw LocalDatabaseException();
    }
  }
}

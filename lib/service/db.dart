import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tr_store/data/models/product_model.dart';

class DbService {
  Database? _db;

  Future<Database> createDB() async {
    if (_db != null) {
      return _db!;
    }

    String path = join(await getDatabasesPath(), 'cart_item.db');
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      db.execute('''
          CREATE TABLE products(
            primaryId INTEGER PRIMARY KEY AUTOINCREMENT,
            id INTEGER,
            slug TEXT,
            url TEXT,
            title TEXT,
            content TEXT,
            image TEXT,
            thumbnail TEXT,
            userId INTEGER,
            count INTEGER
          );
        ''').catchError((val) => log(val));
    });
    return _db!;
  }

  Future<int?> createItem(ProductModel productModel) async {
    Database db = await createDB();
    return db.insert('products', productModel.toJson());
  }

  Future<int> updateItem(ProductModel productModel) async {
    Database db = await createDB();
    return db.update('products', productModel.toJson(),
        where: 'slug = ?', whereArgs: [productModel.slug]);
  }

  Future<List<ProductModel>> allItems() async {
    Database db = await createDB();
    var list = await db.query('products');
    return list.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<int> deleteItem(String slug) async {
    Database db = await createDB();
    return db.delete('products', where: 'slug = ?', whereArgs: [slug]);
  }
}

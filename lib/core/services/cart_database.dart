import 'package:path/path.dart';
import 'package:shop_getx_firebase/consts/txt.dart';
import 'package:shop_getx_firebase/model/cart_product_model.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabase {
  CartDatabase._();

  static final CartDatabase db = CartDatabase._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDb();
    return _database!;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'Cartproduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE ${CartConstants.tableCartProduct}(
      ${CartConstants.columnName} TEXT NOT NULL,
      ${CartConstants.columnImage} TEXT NOT NULL,
      ${CartConstants.columnPrice} TEXT NOT NULL,
      ${CartConstants.columnProductId} TEXT NOT NULL,
      ${CartConstants.columnQuantity} INTEGER NOT NULL
      )
      ''');
    });
  }

  Future<List<CartProductModel>> addAllProducts() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(CartConstants.tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return list;
  }

  insertProduct(CartProductModel model) async {
    var dbClient = await database;
    await dbClient.insert(
      CartConstants.tableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  updateProduct(CartProductModel model) async {
    var dbClient = await database;
    await dbClient.update(CartConstants.tableCartProduct, model.toJson(),
        where: '${CartConstants.columnProductId}=?',
        whereArgs: [model.productId]);
  }
}

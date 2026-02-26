import 'package:hive/hive.dart';
import '../models/product_model.dart';

class LocalDbService {
  static const String _boxName = "productsBox";

  Future<void> saveProducts(List<ProductModel> products) async {
    var box = await Hive.openBox<ProductModel>(_boxName);
    await box.clear();
    await box.addAll(products);
  }

  Future<List<ProductModel>> getCachedProducts() async {
    var box = await Hive.openBox<ProductModel>(_boxName);
    return box.values.toList();
  }
}
import 'package:add_all/add/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoreService {
  final db = FirebaseFirestore.instance;
  Future<void> saveProduct(Product product) async {
    await db.collection('product').add(product.toMap());
  }
}

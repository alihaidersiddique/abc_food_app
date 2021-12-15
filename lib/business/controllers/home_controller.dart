import 'package:abc_food_app/business/services/firestore_home.dart';
import 'package:abc_food_app/models/category_model.dart';
import 'package:abc_food_app/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  List<CategoryModel> _categories = [];
  List<ProductModel> _products = [];

  List<CategoryModel> get categories => _categories;
  List<ProductModel> get products => _products;

  bool _loading = false;
  bool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    _getCategoriesFromFirestore();
    _getProductsFromFirestore();
  }

  _getCategoriesFromFirestore() async {
    _loading = true;
    List<QueryDocumentSnapshot> categoriesSnapshot =
        await FirestoreHome().getCategoriesFromFirestore();

    for (var category in categoriesSnapshot) {
      _categories
          .add(CategoryModel.fromJson(category.data() as Map<String, dynamic>));
    }
    _loading = false;
    update();
  }

  _getProductsFromFirestore() async {
    _loading = true;
    List<QueryDocumentSnapshot> productsSnapshot =
        await FirestoreHome().getProductsFromFirestore();

    for (var product in productsSnapshot) {
      _products
          .add(ProductModel.fromJson(product.data() as Map<String, dynamic>));
    }
    _loading = false;
    update();
  }
}

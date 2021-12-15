import 'package:abc_food_app/business/services/local_database_cart.dart';
import 'package:abc_food_app/models/cart_model.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  List<CartModel> _cartProducts = [];

  List<CartModel> get cartProducts => _cartProducts;

  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  @override
  void onInit() {
    super.onInit();
    getCartProducts();
  }

  getCartProducts() async {
    _cartProducts = await LocalDatabaseCart.db.getAllProducts();
    getTotalPrice();
    update();
  }

  addProducts(CartModel cartModel) async {
    bool _isExist = false;
    for (var item in _cartProducts) {
      if (item.productId == cartModel.productId) {
        _isExist = true;
      }
    }
    if (!_isExist) {
      await LocalDatabaseCart.db.insertProduct(cartModel);
      getCartProducts();
    }
  }

  removeProduct(String productId) async {
    await LocalDatabaseCart.db.deleteProduct(productId);
    getCartProducts();
  }

  getTotalPrice() {
    _totalPrice = 0;
    for (var item in _cartProducts) {
      _totalPrice += (double.parse(item.price) * item.quantity);
    }
  }

  increaseQuantity(int index) async {
    _cartProducts[index].quantity++;
    getTotalPrice();
    await LocalDatabaseCart.db.update(_cartProducts[index]);
    update();
  }

  decreaseQuantity(int index) async {
    if (_cartProducts[index].quantity != 0) {
      _cartProducts[index].quantity--;
      getTotalPrice();
      await LocalDatabaseCart.db.update(_cartProducts[index]);
      update();
    }
  }
}

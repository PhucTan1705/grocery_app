
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/product.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxList<Product> cartItems = List<Product>.empty(growable: true).obs;
  int get totalQuantity => cartItems.length;

  void addToCart(Product product) {
    final existingProductIndex = cartItems.indexWhere((item) => item.id == product.id);

    if (existingProductIndex != -1) {
      cartItems[existingProductIndex].quantity += product.quantity;
    } else {
      cartItems.add(product);
    }
  }

  void removeFromCart(Product product) {
    if (cartItems.contains(product)) {
      final index = cartItems.indexWhere((item) => item == product);
      cartItems.removeAt(index); // Xoa san pham
    }
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (final product in cartItems) {
      totalPrice += product.tags.first.price * product.quantity;
    }
    return totalPrice;
  }

  void clearCart() {
    cartItems.clear();
  }
}

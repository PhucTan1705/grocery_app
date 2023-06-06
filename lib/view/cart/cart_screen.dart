import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import '../../const.dart';
import '../../controller/cart_controller.dart';
import '../Payment/payment_view.dart';

class ShoppingCartPage extends StatefulWidget {
  final CartController cartController;

  const ShoppingCartPage({Key? key, required this.cartController}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    final productList = widget.cartController.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ Hàng'),
        backgroundColor: Colors.green.shade900,
        actions: [
          IconButton(
            onPressed: () {
              if (widget.cartController.cartItems.isNotEmpty) {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(
                      totalPrice: widget.cartController.getTotalPrice(),
                      purchasedProducts: widget.cartController.cartItems,
                      productList: productList,
                    ),
                  ),
                );
              } else {
                Get.snackbar(
                  'Bạn Không Có Sản Phẩm Trong Giỏ Hàng',
                  'Hãy Mua Sản Phẩm và Quay Lại Thanh Toán',
                  snackPosition: SnackPosition.TOP,
                );
              }
            },
            icon: const Padding(
              padding: EdgeInsets.only(left: 0, right: 10, bottom: 0),
              child: Icon(Icons.shopping_cart_checkout),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return ListTile(
                  leading: product.images.isNotEmpty
                      ? CachedNetworkImage(
                    imageUrl: baseUrl + product.images.first,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )
                      : const SizedBox.shrink(),
                  title: Text(product.name),
                  subtitle: Text('${product.tags.first.price.toStringAsFixed(2)}đ'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (product.quantity > 1) {
                            setState(() {
                              product.quantity -= 1;
                            });
                          }
                        },
                      ),
                      Text(
                        '${product.quantity}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            product.quantity += 1;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          widget.cartController.removeFromCart(product);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tổng Giá:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${widget.cartController.getTotalPrice().toStringAsFixed(2)}đ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
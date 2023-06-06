import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:my_grocery/controller/cart_controller.dart';
import 'package:my_grocery/view/home/home_screen.dart';

import '../../model/product.dart';


class PaymentPage extends StatelessWidget {
  final double totalPrice;
  final List<Product> purchasedProducts;
  final List<String> paymentMethods = [
    'assets/visa_logo.png',
    'assets/mastercard_logo.png',
    'assets/paypal_logo.png',
  ];
  final List<Product> productList;

  PaymentPage({
    Key? key,
    required this.totalPrice,
    required this.purchasedProducts,
    required this.productList,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final pay= (totalPrice ~/ 23475).toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
        backgroundColor: Colors.green.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sản phẩm mua:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: purchasedProducts.map((product) {
                    return ListTile(
                      leading: const Icon(Icons.check),
                      title: Text(
                        '${product.name} (Số lượng: ${product.quantity})',
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Tổng Cộng:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${totalPrice.toStringAsFixed(2)}đ',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),
            const Text(
              'Thanh toán ngay:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: paymentMethods
                        .map(
                          (logoPath) => Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          logoPath,
                          width: 80,
                          height: 80,
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>

                        PaypalCheckout(
                          sandboxMode: true,
                          clientId: "AfQKKY75CnsWAMCciT6PdlbchJZEBDtQCRDXWBR5-Jt1qzB2O83VabBG878DiaY9pCcjywU949n6wj45",
                          secretKey: "EK6EwdrvhWZ-QB8AYUfBoKdxqFLwHtp5cAmVzQIBdKckYudflbJkZ8x1_zUffvHddoKhKRX_FOnQkXwt",
                          returnURL: "https://sandbox.paypal.com",
                          cancelURL: "https://sandbox.paypal.com",
                          transactions:  [
                            {
                              "amount": {
                                "total": pay,
                                "currency": "USD",
                                "details": {
                                  "subtotal": pay,
                                  "shipping": '0',
                                  "shipping_discount": 0
                                }
                              },
                              "description": "The payment transaction description.",
                              "item_list": const {
                                "items": [

                                ],
                                // shipping address is Optional
                                "shipping_address": {
                                  "recipient_name": "Tan",
                                  "line1": "Hóa Đơn Mua Hàng",
                                  "line2": "",
                                  "city": "HCM",
                                  "country_code": "VN",
                                  "postal_code": "11001",
                                  "phone": "+866488617",
                                  "state": "VN"
                                },
                              }
                            }
                          ],
                          note: "PAYMENT_NOTE",
                          onSuccess: (Map params) async {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );

                          },
                          onError: (error) {
                            print("Lỗi: $error");
                            Navigator.pop(context);
                          },
                          onCancel: () {
                            print('Thanh toán đã tạm ngừng');
                          },
                        ),

                  ));
                  CartController.instance.clearCart();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  primary: Colors.green.shade900,
                ),
                child: const Text(
                  'Thanh Toán',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
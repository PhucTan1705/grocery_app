import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/view/category/category_screen.dart';

import '../controller/cart_controller.dart';
import '../route/app_route.dart';
import '../view/account/auth/sign_in_screen.dart';
import '../view/cart/cart_screen.dart';
import '../view/dashboard/dashboard_binding.dart';
import '../view/dashboard/dashboard_screen.dart';

class MainHeader extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  MainHeader({Key? key}) : super(key: key);

  void goToCartPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShoppingCartPage(cartController: cartController,),
      ),
    );
  }

  void openFilter(BuildContext context) {
    dashboardController.updateIndex(2);


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(24),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    offset: const Offset(0, 0),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Obx(
                    () => TextField(
                  autofocus: false,
                  controller: productController.searchTextEditController,
                  onSubmitted: (val) {
                    productController.getProductByName(keyword: val);
                    dashboardController.updateIndex(1);
                  },
                  onChanged: (val) {
                    productController.searchVal.value = val;
                  },
                  decoration: InputDecoration(
                    suffixIcon: productController.searchVal.value.isNotEmpty
                        ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        productController.searchTextEditController.clear();
                        productController.searchVal.value = '';
                        productController.getProducts();
                      },
                    )
                        : null,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 26),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Tìm kiếm...",
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              openFilter(context);
            },
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 8,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.filter_alt_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 10),
          badges.Badge(
            badgeContent: Obx(
                  () => Text(
                cartController.totalQuantity.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: Theme.of(context).primaryColor,
            ),
            child: GestureDetector(
              onTap: () {
                if (authController.user.value != null) {
                  goToCartPage(context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                }
              },
              child: Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 8,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}

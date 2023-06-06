import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/view/Profile/profile_view.dart';
import 'package:my_grocery/view/account/auth/sign_in_screen.dart';
import 'package:my_grocery/view/thankyou/about_us_view.dart';

import '../../controller/auth_controller.dart';
import '../../model/user.dart';
import '../License/license_view.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/user_image.png"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      authController.user.value?.fullName ?? "Đăng nhập",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          buildAccountCard(
              title: "Thông tin người dùng",

              onclick: () {

                if (authController.user.value != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ));
                }
              }),
          buildAccountCard(title: "Thông báo", onclick: () {}),
          buildAccountCard(title: "Cài đặt", onclick: () {}),
          buildAccountCard(title: "Về chúng tôi", onclick: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUsPage(),
                ));
          }),
          buildAccountCard(
              title: "Giấy Phép",
              onclick: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => Theme(
                        data: Theme.of(context).copyWith(
                          appBarTheme: AppBarTheme(
                            color: Colors.green.shade900,
                          ),
                        ),
                        child: const LicenseView(),
                      ),
                    ));
              }),
          Obx(() => buildAccountCard(
              title:
                  authController.user.value == null ? "Đăng nhập" : "Đăng Xuất",
              onclick: () {
                if (authController.user.value != null) {
                  authController.signOut();
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ));
                }
              })),
        ],
      ),
    );
  }

  Widget buildAccountCard({
    required String title,
    required Function() onclick,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: () {
          onclick();
        },
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 0.1,
                  blurRadius: 7,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              const Icon(Icons.keyboard_arrow_right_outlined)
            ],
          ),
        ),
      ),
    );
  }
}

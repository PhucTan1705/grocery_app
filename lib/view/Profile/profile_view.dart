import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controller/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  final AuthController _authController = AuthController.instance;

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    _authController.fetchUserProfile();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thông tin người dùng',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24.0),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 180.0,
                      height: 180.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 8.0,
                        ),
                        image: DecorationImage(
                          image: _authController.user.value?.image != null
                              ? NetworkImage(_authController.user.value!.image!)
                              : const AssetImage('assets/default_avatar.png') as ImageProvider<Object>,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green.shade900,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              _authController.user.value?.fullName ?? 'Loading...',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 8.0),
            Text(
              _authController.user.value?.email ?? '',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade900,
                textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Chỉnh sửa thông tin'),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
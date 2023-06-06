import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_grocery/service/local_service/local_auth_service.dart';
import 'package:my_grocery/service/remote_service/remote_auth_service.dart';

import '../model/user.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> user=Rxn<User>();
  final LocalAuthService _localAuthService= LocalAuthService();

  @override
  void onInit() async {
    await _localAuthService.init();
    await fetchUserProfile();
    super.onInit();
  }

  void signUp({required String fullName, required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Vui lòng chờ...',
        dismissOnTap: false,
      );
      var result= await RemoteAuthService().signUp(
          email: email,
          password: password,
      );
      if(result.statusCode==200){
        String token= json.decode(result.body)['jwt'];
        var userResult= await RemoteAuthService().createProfile(fullName: fullName, token: token);
        if(userResult.statusCode==200){
          user.value= userFromJson(userResult.body);
          await _localAuthService.addToken(token: token);
          await _localAuthService.addUser(user: user.value!);
          EasyLoading.showSuccess("Chúc bạn mua sắm vui vẻ!");
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError("Đã có lỗi, xin vui lòng tử lại!");
        }
      } else {
        EasyLoading.showError("Đã có lỗi, xin vui lòng tử lại!");
      }
    } catch(e) {
      EasyLoading.showError("Đã có lỗi, xin vui lòng tử lại!");
    }
    finally {
      EasyLoading.dismiss();
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Vui lòng chờ...',
        dismissOnTap: false,
      );
      var result= await RemoteAuthService().signIn(
        email: email,
        password: password,
      );
      if(result.statusCode==200){
        String token= json.decode(result.body)['jwt'];
        var userResult= await RemoteAuthService().getProfile(token: token);
        if(userResult.statusCode==200){
          user.value= userFromJson(userResult.body);
          await _localAuthService.addToken(token: token);
          await _localAuthService.addUser(user: user.value!);
          EasyLoading.showSuccess("Chúc bạn mua sắm vui vẻ!");
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError("Đã có lỗi, xin vui lòng tử lại!");
        }
      } else {
        EasyLoading.showError("Đã có lỗi, xin vui lòng tử lại!");
      }
    } catch(e) {
      EasyLoading.showError("Đã có lỗi, xin vui lòng tử lại!");
    }
    finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    user.value=null;
    await _localAuthService.clear();
  }

  Future<void> fetchUserProfile() async {
    try {
      EasyLoading.show(
        status: 'Đang lấy thông tin người dùng...',
        dismissOnTap: false,
      );

      String? token = await _localAuthService.getToken();
      if (token != null) {
        var user = await RemoteAuthService().getUserProfile(token: token);
        this.user.value = user;
        await _localAuthService.addUser(user: user);
      } else {
        throw Exception('Không tìm thấy người dùng');
      }

      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError('Bạn chưa đăng nhập');
    }
  }
}
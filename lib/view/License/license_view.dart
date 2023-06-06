import 'package:flutter/material.dart';

class LicenseView extends StatelessWidget {
  const LicenseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: const LicensePage(
        applicationName: "App Bán Thực Phẩm",
        applicationIcon: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.account_circle),
        ),
        applicationVersion: "0.0.1",
        applicationLegalese: "Giấy Phép",
      ),
    );
  }
}

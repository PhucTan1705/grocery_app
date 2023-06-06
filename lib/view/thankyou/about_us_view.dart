import 'package:flutter/material.dart';


class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: 120.0,
                ),
              ),
            ),
            const Text(
              'Cửa Hàng Thực Phẩm',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Nhanh chóng, dễ dàng, tiện lợi. Chúng tôi cung cấp cho khách hàng những thực phẩm và hàng hóa chất lượng nhất.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Nhiệm vụ của chúng tôi',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Chúng tôi giúp người dùng có thể mua sắm một cách dễ dàng và tiện lợi chỉ với chiếc điện thoại di động. Chúng tôi muốn mang đến cho khách hàng trải nghiệm mua sắm tốt nhất từ bất cứ đâu.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 32.0),
            const Text(
              'Liên hệ chúng tôi',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Email: grocery@gmail.com\n'
                  'Phone: +9999999999',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
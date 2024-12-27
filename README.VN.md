# Laguage
[![en](https://img.shields.io/badge/lang-pt--br-green.svg)]
[![vn](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/PhucTan1705/grocery_app/blob/master/README.VN.md)
# The Grocery App

## Tổng quan:

Một ứng dụng thương mại điện tử di động phát triển bằng Flutter và sử dụng REST API. Ứng dụng cung cấp nhiều tính năng E-Commerce như xem sản phẩm, tìm kiếm, giỏ hàng... Người dùng có thể khám phá sản phẩm, xem chi tiết sản phẩm và thêm chúng vào giỏ hàng...

<div align="center">
  <span><kbd><img src="https://drive.google.com/uc?export=view&id=1rDg4fQMFEyDaFEebESQJZar_Mp7KrdI9" width="300" height="530"  hspace="10"></kbd></span>
  <span><kbd><img src="https://drive.google.com/uc?export=view&id=1c8fRZn_MBzM4s7jtyGAd-bOTdEeqZ_uM" width="300" height="530"  hspace="10"></kbd></span>
  <span><kbd><img src="https://drive.google.com/uc?export=view&id=1VBhIwCnljNyV4wF9W_GSNMiDayHfewku" width="300" height="530"  hspace="10"></kbd></span>
</div>


## Cài đặt:

### 1. NodeJs and Yarn:
   
- [NodeJs LTS](https://nodejs.org/en/download/package-manager)
```
# tải và cài Node.js
fnm install 22
# kiểm tra phiên bản Node.js
node -v # should print "v22.12.0"
# kiểm tra phiên bản npm 
npm -v # should print "10.9.0"
```
- [Yarn](https://classic.yarnpkg.com/lang/en/docs/install/#windows-stable)
```
# cài yarn:
npm install --global yarn
# kiểm tra cài đặt:
yarn --version
```
### 2. Làm quen với Strapi

Strapi offers a lot of flexibility, its come with full [Command Line Interface (CLI)](https://docs.strapi.io/dev-docs/cli) which lets you scaffold and manage your project in seconds. The CLI works with both the yarn and npm package managers.

Strapi cung cấp rất nhiều tính năng linh hoạt, đi kèm với đó là Giao diện Dòng lệnh: [Command Line Interface (CLI)](https://docs.strapi.io/dev-docs/cli) đầy đủ, cho phép bạn xây dựng và quản lý dự án của mình chỉ trong vài giây. CLI hoạt động với cả hai trình quản lý gói là yarn và npm.

[Tìm hiểu thêm](https://docs.strapi.io/dev-docs/cli)

### 3. Cài đặt Strapi

- Trong terminal, chạy lệnh sau:

```
npx create-strapi@latest
# hoặc
yarn create strapi
```

- Terminal sẽ hỏi bạn có muốn Đăng nhập/Đăng ký vào Strapi Cloud hay không (có thể bỏ qua bước này). Sử dụng phím mũi tên và nhấn Enter để chọn. Nếu bạn chọn bỏ qua bước này, bạn sẽ cần tự lưu trữ dự án của mình.

- Terminal sẽ đặt một vài câu hỏi. Với mỗi câu hỏi, nếu bạn nhấn Enter thay vì nhập câu trả lời, câu trả lời mặc định có (Yes) sẽ được sử dụng:
  
<img src="https://docs.strapi.io/assets/images/prompts-00c582a362038488879781cd1c3eca4a.png">

[Tìm hiểu thêm](https://docs.strapi.io/dev-docs/installation/cli)

### 4. Cài đặt dự án:

- Sao chép (clone) repo:
```
git clone https://github.com/PhucTan1705/grocery_app.git
```
- Cài các gói (packages):
```
flutter pub get
```
- Chạy ứng dụng:
```
flutter run lib/main.dart
```
- Chạy test
```
flutter test
```



# The Grocery App

## Overview:

A flutter e-commerce mobile application with REST API. The app showcases a variety of E-Commerce features, such as product browsing, searching, cart... Users can explore products, view produc detail, and add them to their cart...

<div align="center">
  <span><kbd><img src="https://drive.google.com/uc?export=view&id=1rDg4fQMFEyDaFEebESQJZar_Mp7KrdI9" width="300" height="530"  hspace="10"></kbd></span>
  <span><kbd><img src="https://drive.google.com/uc?export=view&id=1c8fRZn_MBzM4s7jtyGAd-bOTdEeqZ_uM" width="300" height="530"  hspace="10"></kbd></span>
  <span><kbd><img src="https://drive.google.com/uc?export=view&id=1VBhIwCnljNyV4wF9W_GSNMiDayHfewku" width="300" height="530"  hspace="10"></kbd></span>
</div>


## Installation:

1. NodeJs and Yarn:
   
- [NodeJs LTS](https://nodejs.org/en/download/package-manager)
```
# download and install Node.js
fnm install 22
# verifies the right Node.js version is in the environment
node -v # should print "v22.12.0"
# verifies the right npm version is in the environment
npm -v # should print "10.9.0"
```
- [Yarn](https://classic.yarnpkg.com/lang/en/docs/install/#windows-stable)
```
# install yarn:
npm install --global yarn
# Check installation:
yarn --version
```
2. Getting started with Strapi

Strapi offers a lot of flexibility, its come with full [Command Line Interface (CLI)](https://docs.strapi.io/dev-docs/cli) which lets you scaffold and manage your project in seconds. The CLI works with both the yarn and npm package managers.

[Learn more](https://docs.strapi.io/dev-docs/cli)

3. Set up Strapi

- In a terminal, run the following command:

```
npx create-strapi@latest
# or
yarn create strapi
```

- The terminal will ask you whether you want to Login/Signup to Strapi Cloud (and start using your free 14-day trial projects), or Skip this step. Use arrow keys and press Enter to make your choice. If you choose to skip this step, you will need to host the project yourself.
- The terminal will ask you a few questions. For each of them, if you press Enter instead of typing something, the default answer (Yes) will be used:
  
<img src="https://docs.strapi.io/assets/images/prompts-00c582a362038488879781cd1c3eca4a.png">

[Learn more](https://docs.strapi.io/dev-docs/installation/cli)

4. Set up project:

- Clone the repo
```
git clone https://github.com/PhucTan1705/grocery_app.git
```
- Install packages:
```
flutter pub get
```
- Run app:
```
flutter run lib/main.dart
```
- Run test
```
flutter test
```

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

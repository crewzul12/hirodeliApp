import 'package:HiroDeli/screens/MyAdress.dart';
import 'package:flutter/material.dart';
import 'package:HiroDeli/screens/Cart.dart';
import 'package:HiroDeli/screens/SearchStore.dart';
import 'package:HiroDeli/screens/Profile.dart';
import 'package:HiroDeli/screens/Login.dart';
import 'package:HiroDeli/screens/Signup.dart';
import 'package:HiroDeli/screens/ForgotPassword.dart';
import 'package:HiroDeli/screens/ResetPasswordSuccess.dart';
import 'package:HiroDeli/screens/Mainpage.dart';
import 'package:HiroDeli/screens/GeneralInformation.dart';
import 'package:HiroDeli/screens/MyOrders.dart';
import 'package:HiroDeli/screens/PaymentMethod.dart';
import 'package:HiroDeli/screens/Home.dart';
import 'package:HiroDeli/screens/Settings.dart';
import 'package:HiroDeli/screens/ReportIssue.dart';
import 'package:HiroDeli/screens/QrCodeScanner.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Persistent storage for JWToken
import 'dart:convert'
    show json, base64, ascii; // Convert Json string into Json object

final storage =
      FlutterSecureStorage(); // Flutter secure storage instance for persistent storage
void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(
        key: "jwt"); // Check if there is jwtoken in persistent storage
    if (jwt == null) return ""; // If jwt is null, return null
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        // MaterialApp routes
        '/home': (BuildContext context) => Home(), // Home page route
        '/login': (BuildContext context) => Login(), // Login page route
        '/signup': (BuildContext context) => Signup(), // Signup page route
        '/forgotPassword': (BuildContext context) =>
            ForgotPassword(), // ForgotPassword page route
        '/resetPasswordSuccess': (BuildContext context) =>
            ResetPasswordSuccess(), // ResetPasswordSuccess page route
        '/generalInfo': (BuildContext context) =>
            GeneralInformation(), // GeneralInformation page route
        '/profile': (BuildContext context) => Profile(), // Profile page route
        '/searchStore': (BuildContext context) => SearchStore(), // SearchStore page route
        '/cart': (BuildContext context) => Cart(), // Cart page route
        '/myAddress': (BuildContext context) =>
            MyAdress(), // MyAdress page route
        '/myOrders': (BuildContext context) =>
            MyOrders(), // MyOrders page route
        '/paymentMethod': (BuildContext context) =>
            PaymentMethod(), // PaymentMethod page route
        '/settings': (BuildContext context) =>
            Settings(), // Settings page route
        '/reportIssue': (BuildContext context) =>
            ReportIssue(), // ReportIssue page route
        '/qrCodeScanner': (BuildContext context) =>
            QrCodeScanner(), // QrCodeScanner page route
      },
      title: 'Authentication Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: jwtOrEmpty,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            if (snapshot.data != "") {
              var str = snapshot.data; // Receive jwt from FutureBuilder
              var jwt = str.split("."); // Split jwt into 3 different strings

              if (jwt.length != 3) {
                // Check if jwt has 3 different strings which is 3 dots, if it has it, it will return TestJwtPage, otherwise return Home page
                return Home();
              } else {
                var payload = json.decode(ascii.decode(base64.decode(
                    base64.normalize(
                        jwt[1])))); // JWT payload receive from FutureBuilder
                if (DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000)
                    .isAfter(DateTime.now())) {
                  // Check if expiration jwt date is after current date, if it is, it will return TestJwtPage which means not expired yet, otherwise it will return Home page which is expired
                  return Mainpage(str, payload);
                } else {
                  return Home();
                }
              }
            } else {
              return Home();
            }
          }),
    );
  }
}

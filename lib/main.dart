import 'package:HiroDeli/screens/MyAdress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:HiroDeli/screens/Login.dart';
import 'package:HiroDeli/screens/TestJwtPage.dart';
import 'package:HiroDeli/screens/Signup.dart';
import 'package:HiroDeli/screens/ForgotPassword.dart';
import 'package:HiroDeli/screens/SignupName.dart';
import 'package:HiroDeli/screens/SignupPhoneNum.dart';
import 'package:HiroDeli/screens/ResetPasswordSuccess.dart';
import 'package:HiroDeli/screens/Mainpage.dart';
import 'package:HiroDeli/screens/Cart.dart';
import 'package:HiroDeli/screens/SearchStore.dart';
import 'package:HiroDeli/screens/Profile.dart';
import 'package:HiroDeli/screens/GeneralInformation.dart';
import 'package:HiroDeli/screens/MyOrders.dart';
import 'package:HiroDeli/screens/PaymentMethod.dart';
import 'package:HiroDeli/screens/Settings.dart';
import 'package:HiroDeli/screens/Refund.dart';
import 'package:HiroDeli/screens/ReportIssue.dart';
import 'package:HiroDeli/screens/QrCodeScanner.dart';
import 'package:HiroDeli/screens/Location.dart';
import 'dart:convert'
    show json, base64, ascii; // Convert Json string into Json object

void main() {
  runApp(MyApp());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xddd60606),
        body: Container(
          child: Stack(
            children: <Widget>[
              Center(
                child: SvgPicture.asset(
                  'assets/hirodeli-logo.svg',
                  width: 290,
                  height: 170,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          color: Color(0xffffffff),
                          padding: EdgeInsets.all(20),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: Text(
                            'LOG IN',
                            style: TextStyle(
                              color: Colors.cyanAccent[700],
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: OutlineButton(
                          padding: EdgeInsets.all(20),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/signup');
                          },
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          borderSide: BorderSide(
                            color: Colors.redAccent, //Color of the border
                            style: BorderStyle.solid, //Style of the border
                            width: 0.5, //width of the border
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
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
        '/signupName': (BuildContext context) =>
            SignupName(), // SignupName page route
        '/signupPhoneNum': (BuildContext context) =>
            SignupPhoneNum(), // SignupPhoneNum page route
        '/resetPasswordSuccess': (BuildContext context) =>
            ResetPasswordSuccess(), // ResetPasswordSuccess page route
        '/mainPage': (BuildContext context) =>
            Mainpage(), // Mainpage page route
        '/cart': (BuildContext context) => Cart(), // Cart page route
        '/searchStore': (BuildContext context) =>
            SearchStore(), // SearchStore page route
        '/profile': (BuildContext context) => Profile(), // Profile page route
        '/generalInfo': (BuildContext context) =>
            GeneralInformation(), // GeneralInformation page route
        '/myAddress': (BuildContext context) =>
            MyAdress(), // MyAdress page route
        '/myOrders': (BuildContext context) =>
            MyOrders(), // MyOrders page route
        '/paymentMethod': (BuildContext context) =>
            PaymentMethod(), // PaymentMethod page route
        '/settings': (BuildContext context) =>
            Settings(), // Settings page route
        '/refund': (BuildContext context) => Refund(), // Refund page route
        '/reportIssue': (BuildContext context) =>
            ReportIssue(), // ReportIssue page route
        '/qrCodeScanner': (BuildContext context) =>
            QrCodeScanner(), // QrCodeScanner page route
        '/location': (BuildContext context) =>
            Location(), // Location page route
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
                  return TestJwtPage(str, payload);
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

// import 'package:HiroDeli/screens/MyAdress.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:HiroDeli/screens/Loading.dart';
import 'package:HiroDeli/screens/Login.dart';
import 'package:HiroDeli/screens/TestJwtPage.dart';
// import 'package:HiroDeli/screens/Signup.dart';
// import 'package:HiroDeli/screens/ForgotPassword.dart';
// import 'package:HiroDeli/screens/SignupName.dart';
// import 'package:HiroDeli/screens/SignupPhoneNum.dart';
// import 'package:HiroDeli/screens/ResetPasswordSuccess.dart';
// import 'package:HiroDeli/screens/Mainpage.dart';
// import 'package:HiroDeli/screens/Cart.dart';
// import 'package:HiroDeli/screens/SearchStore.dart';
// import 'package:HiroDeli/screens/Profile.dart';
// import 'package:HiroDeli/screens/GeneralInformation.dart';
// import 'package:HiroDeli/screens/MyOrders.dart';
// import 'package:HiroDeli/screens/PaymentMethod.dart';
// import 'package:HiroDeli/screens/Settings.dart';
// import 'package:HiroDeli/screens/Refund.dart';
// import 'package:HiroDeli/screens/ReportIssue.dart';
// import 'package:HiroDeli/screens/QrCodeScanner.dart';
// import 'package:HiroDeli/screens/Location.dart';
// import 'dart:convert'
//     show json, base64, ascii; // Convert Json string into Json object

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt"); // Check if there is jwtoken in persistent storage
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: jwtOrEmpty,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            if (snapshot.data != "") {
              var str = snapshot.data;
              if (str == null) {
                return Login();
              } else {
                return TestJwtPage(str);
              }
            } else {
              return Login();
            }
          }),
    );
  }
}

// void main() => runApp(MaterialApp(
//       initialRoute: '/home',
//       routes: <String, WidgetBuilder>{
//         '/': (BuildContext context) => Loading(),
//         '/home': (BuildContext context) => Home(),
//         '/login': (BuildContext context) => Login(),
//         '/signup': (BuildContext context) => Signup(),
//         '/forgotPassword': (BuildContext context) => ForgotPassword(),
//         '/signupName': (BuildContext context) => SignupName(),
//         '/signupPhoneNum': (BuildContext context) => SignupPhoneNum(),
//         '/resetPasswordSuccess': (BuildContext context) =>
//             ResetPasswordSuccess(),
//         '/mainPage': (BuildContext context) => Mainpage(),
//         '/cart': (BuildContext context) => Cart(),
//         '/searchStore': (BuildContext context) => SearchStore(),
//         '/profile': (BuildContext context) => Profile(),
//         '/generalInfo': (BuildContext context) => GeneralInformation(),
//         '/myAddress': (BuildContext context) => MyAdress(),
//         '/myOrders': (BuildContext context) => MyOrders(),
//         '/paymentMethod': (BuildContext context) => PaymentMethod(),
//         '/settings': (BuildContext context) => Settings(),
//         '/refund': (BuildContext context) => Refund(),
//         '/reportIssue': (BuildContext context) => ReportIssue(),
//         '/qrCodeScanner': (BuildContext context) => QrCodeScanner(),
//         '/location': (BuildContext context) => Location(),
//       },
//     ));

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   Future<String> get jwtOrEmpty async {
//     var jwt = await storage.read(key: "jwt");
//     if (jwt == null) return "";
//     return jwt;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xddd60606),
//         body: Container(
//           child: Stack(
//             children: <Widget>[
//               Center(
//                 child: SvgPicture.asset(
//                   'assets/hirodeli-logo.svg',
//                   width: 290,
//                   height: 170,
//                 ),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   Row(
//                     children: <Widget>[
//                       Expanded(
//                         flex: 1,
//                         child: FlatButton(
//                           color: Color(0xffffffff),
//                           padding: EdgeInsets.all(20),
//                           onPressed: () {
//                             Navigator.of(context).pushNamed('/login');
//                           },
//                           child: Text(
//                             'LOG IN',
//                             style: TextStyle(
//                               color: Colors.cyanAccent[700],
//                             ),
//                           ),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.zero),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: OutlineButton(
//                           padding: EdgeInsets.all(20),
//                           onPressed: () {
//                             Navigator.of(context).pushNamed('/signup');
//                           },
//                           child: Text(
//                             'SIGN UP',
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                           borderSide: BorderSide(
//                             color: Colors.redAccent, //Color of the border
//                             style: BorderStyle.solid, //Style of the border
//                             width: 0.5, //width of the border
//                           ),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.zero),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }

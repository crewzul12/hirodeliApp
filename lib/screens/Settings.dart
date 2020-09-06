import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Persistent storage for JWToken

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final storage =
      FlutterSecureStorage(); // Flutter secure storage instance for persistent storage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Color(0xddd60606),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 1.0,
        child: Container(
          margin: EdgeInsets.only(top: 15),
          child: Column(children: [
            Container(
              child: Card(
                elevation: 9,
                shadowColor: Colors.teal[50],
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: 67,
                    child: Text(
                      'Become a vendor/rider',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Card(
                elevation: 9,
                shadowColor: Colors.teal[50],
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.of(context).pushNamed('/reportIssue');
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: 67,
                    child: Text(
                      'Report an issue',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Card(
                elevation: 9,
                shadowColor: Colors.teal[50],
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () async {
                    await storage.delete(
                        key:
                            'jwt'); // Delete persistent storage key named "jwt"
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home',
                        (Route<dynamic> route) =>
                            false); // Push home route after logout and remove all previous routes
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: 67,
                    child: Text(
                      'Log out',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Persistent storage for JWToken

final storage =
      FlutterSecureStorage(); // Flutter secure storage instance for persistent storage

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
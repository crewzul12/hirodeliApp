import 'package:flutter/material.dart';
// import 'dart:convert'
//     show json, base64, ascii; // Convert Json string into Json object
import 'package:http/http.dart'
    as http; // Http client package for request and response

class TestJwtPage extends StatelessWidget {
  TestJwtPage(this.jwt);

  factory TestJwtPage.fromBase64(String jwt) => TestJwtPage(jwt);

  final String jwt;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Secret Data Screen")),
        body: Center(
          child: FutureBuilder(
              future: http.read(
                  'https://jwt-test-login.herokuapp.com/api/hello-view/',
                  headers: {
                    "Authorization": "JWT " + jwt,
                    "X-Hiro-Deli-Api-Auth-X":
                        "psXUoVRx.SDlmMEPPjLqe8vMgodzQKwYwuCaOrVsE"
                  }),
              builder: (context, snapshot) => snapshot.hasData
                  ? Column(
                      children: <Widget>[
                        Text("Hirodeli Jwtoken test page"),
                        Text(snapshot.data),
                        Text(jwt)
                      ],
                    )
                  : snapshot.hasError
                      ? Text("An error occurred")
                      : CircularProgressIndicator()),
        ),
      );
}

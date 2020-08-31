import 'package:flutter/material.dart';
import 'dart:convert'
    show json, base64, ascii; // Convert Json string into Json object
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Persistent storage for JWToken

class TestJwtPage extends StatelessWidget {
  TestJwtPage(
      this.jwt, this.payload); // Receive jwt from FutureBuilder snapshot.data

  factory TestJwtPage.fromBase64(String jwt) => TestJwtPage(
      jwt,
      json.decode(ascii.decode(base64.decode(base64.normalize(jwt.split(".")[
          1]))))); // Split 3 dots from response body into different string and normalize
  // Normalize will do the following:
  // Unescape any %-escapes.
  // Only allow valid characters (A-Z, a-z, 0-9, / and +).
  // Normalize a _ or - character to / or +.
  // Validate that existing padding (trailing = characters) is correct.
  // If no padding exists, add correct padding if necessary and possible.
  // Validate that the length is correct (a multiple of four).
  final String jwt; // Jwt access token
  final Map<String, dynamic> payload; // JWT payload from response body into Map structure
  final storage =
      FlutterSecureStorage(); // Flutter secure storage instance for persistent storage
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Secret Data Screen")),
        body: Center(
            child: Column(
          children: <Widget>[
            Text(jwt),
            Text(payload['token_type'].toString()), // Display token type
            Text(payload['exp'].toString()), // Display expiration time and date in Epoch unit time
            Text(payload['jti'].toString()),
            Text(payload['user_id'].toString()), // Display user id
            RaisedButton(
              onPressed: () async {
                await storage.delete(
                    key: 'jwt'); // Delete persistent storage key named "jwt"
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/home', (Route<dynamic> route) => false);
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: const Text('LOG OUT', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        )),
      );
}

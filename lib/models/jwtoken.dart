// To parse this JSON data, do
//
//     final jwToken = jwTokenFromJson(jsonString);

import 'dart:convert'; // Convert package json decode and encode

JwToken jwTokenFromJson(String str) => JwToken.fromJson(json.decode(str));

String jwTokenToJson(JwToken data) => json.encode(data.toJson());

class JwToken {
  JwToken({
    this.refresh,
    this.access,
  }); // Constructor

  String refresh; // Refresh token for user
  String access; // Access token for user

  factory JwToken.fromJson(Map<String, dynamic> json) => JwToken( // Constructing a new JwToken instance from Map structure
        refresh: json["refresh"], // initialize Map key named "refresh" into JwToken refresh
        access: json["access"], // initialize Map key named "access" into JwToken access
      );

  Map<String, dynamic> toJson() => { // Convert JwToken instance into Map
        "refresh": refresh,
        "access": access,
      };
}

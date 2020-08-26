import 'package:HiroDeli/models/location.dart';

class Geometry {
  final Location location; // Geometry location which contain latitude and longitude value
  
  Geometry({this.location}); // Constructor

  Geometry.fromJson(Map<dynamic,dynamic> parsedJson) // Parse Json into Map with dynamic key and value type (Put all data from Json into a new instance which is Map type)
    :location = Location.fromJson(parsedJson['location']); // Parse Json into parsedJson Map with key named "location" and put all data from Json into a new instance which is Map type, after that initialize into location)
}
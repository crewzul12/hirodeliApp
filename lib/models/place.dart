import 'package:HiroDeli/models/geometry.dart';

// Place object model
class Place {
  final String name; // Place name
  final String vicinity; // Place address
  final Geometry geometry; // Place geometry which location (latitude and longitude) and viewport 

  Place({this.name, this.vicinity, this.geometry}); // Constructor

  Place.fromJson(Map<dynamic,dynamic> parsedJson) // Parse Json into Map with dynamic key and value type (Put all data from Json into new instance which is Map type)
    :name = parsedJson['name'], // initialize key named "name" from parsedJson type Map<dynamic, dynamic>
    vicinity = parsedJson['vicinity'], // initialize key named "vicinity" from parsedJson type Map<dynamic, dynamic>
    geometry = Geometry.fromJson(parsedJson['geometry']); // Parse Json into parsedJson Map with key named "geometry" and put all data from Json into a new instance which is Map type, after that initialize into geometry)
}
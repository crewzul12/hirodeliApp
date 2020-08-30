import 'package:HiroDeli/models/location.dart'; // import Location data model

class Geometry {
  final Location location; // Geometry location which contain latitude and longitude value
  
  Geometry({this.location}); // Constructor

  Geometry.fromJson(Map<dynamic,dynamic> parsedJson) // Constructing a new Geometry instance from a Map structure
    :location = Location.fromJson(parsedJson['location']); // Parse Json into parsedJson Map with key named "location" and put all data from Json into a new instance which is Map type, after that initialize into location)
}
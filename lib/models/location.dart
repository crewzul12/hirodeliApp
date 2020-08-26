class Location {
  final double lat; // Place latitude
  final double lng; // Place longitude
  
  Location({this.lat, this.lng}); // Constructor

  Location.fromJson(Map<dynamic,dynamic> parsedJson) //  Parse Json into Map with dynamic key and value type (Put all data from Json into a new instance which is Map type)
    :lat = parsedJson['lat'], // initialize Map key named "lat" into Location lat
    lng = parsedJson['lng']; // initialize Map key named "lng" into Location lng
}
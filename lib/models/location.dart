class Location {
  final double lat; // Place latitude
  final double lng; // Place longitude

  Location({this.lat, this.lng}); // Constructor

  Location.fromJson(
      Map<dynamic, dynamic>
          parsedJson) // Constructing a new Location instance from a Map structure
      : lat = parsedJson[
            'lat'], // initialize Map key named "lat" into Location lat
        lng = parsedJson[
            'lng']; // initialize Map key named "lng" into Location lng
}

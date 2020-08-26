import 'package:geolocator/geolocator.dart';

class GeoLocatorService {
  final geolocator = Geolocator(); // create instance of Geolocator from geolocator.dart

  Future<Position> getLocation() async {
    var geolocator = new Geolocator(); // Create instance of Geolocator
    return await geolocator.getCurrentPosition( // return current position latitud and longitude
        desiredAccuracy: LocationAccuracy.high,
        locationPermissionLevel: GeolocationPermission.location); // Call function from Geolocator() instance to receive current location of device
  }

  Future<double> getDistance(double startLatitude, double startLongitude, double endLatitude, double endLongitude) async { // Calculate distance from user device to destination
    return await geolocator.distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude); // return Future value as which is distance between current location and place as double
  }
}

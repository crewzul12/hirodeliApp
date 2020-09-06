import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:HiroDeli/services/geolocator_service.dart'; // import GeoLocatorService class
import 'package:geolocator/geolocator.dart'; // import Geolocator() instance

class AddAdress extends StatefulWidget {
  @override
  _AddAdressState createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  final locatorService =
      GeoLocatorService(); // create an instance of GeoLocatorService to use future getLocation() inside FutureProvider
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(
        context); // current position with latitude and longitude value from Position generic type that provide by Provider
    return MultiProvider(
      providers: [
        FutureProvider(
          create: (context) => locatorService
              .getLocation(), // Create a FutureProvider to retrieve the value return by Future
        ),
      ],
      child: Scaffold(
          floatingActionButton: Container(
            margin: EdgeInsets.only(top: 10),
            width: 40,
            height: 40,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xddd60606),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height /
                    2, // Height of google map layout
                width: MediaQuery.of(context)
                    .size
                    .width, // Width of google map layout
                child: GoogleMap(
                  // GoogleMap widget
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                          currentPosition.latitude, currentPosition.longitude),
                      zoom: 16.0),
                  zoomGesturesEnabled: true, // Enable zoom feature
                ),
              ),
            ],
          )),
    );
  }
}

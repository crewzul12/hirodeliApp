import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // import Geolocator data model
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:HiroDeli/services/geolocator_service.dart';
import 'package:HiroDeli/services/places_service.dart';
import 'package:HiroDeli/models/place.dart'; // import Place data model


class Location extends StatefulWidget {
  // Create a stateful widget that can be changed
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final locatorService =
      GeoLocatorService(); // create an instance of GeoLocatorService to use future getLocation() inside FutureProvider
  final placesService = PlacesService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // To store all Provider to prevent nested Provider (easy to read)
      providers: [
        FutureProvider(
            create: (context) => locatorService
                .getLocation()), // Create FutureProvider to retrieve Future value that return by the Future
        ProxyProvider<Position, Future<List<Place>>>(
            // Combine multiple values return by other providers into new object such as position and places and send it back to provider
            update: (context, position, places) {
          return (position !=
                  null) // Check if position latitude and longitude value is not equal to null, if true it will call Future getPlaces() to return list of places nearby, if it false, then it will return null
              ? placesService.getPlaces(
                  position.latitude,
                  position
                      .longitude) // Call Future by passing current position latitude and longitude as parameter from GeoLocatorService() to PlacesServices() to retrieve all places nearby the current location
              : null;
        })
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Search(),
      ),
    );
  }
}

class Search extends StatefulWidget {
  // Create a stateful widget that can be changed
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(
        context); // current position with latitude and longitude value from Position generic type that provide by Provider
    final placeProvider = Provider.of<Future<List<Place>>>(
        context); // Retrieve Provider that provide all values from the type, so that it can be created by FutureProvider
    final geoService =
        GeoLocatorService(); // Create instance of GeoLocatorService to use getDistance() method
    return FutureProvider(
      create: (context) =>
          placeProvider, // receive list of place value as Future getPlaces()
      child: Scaffold(
        body: (currentPosition !=
                null) // Check if current position value that retrieve by Provider is not null, if it true, it will return Consumer widget, otherwise it will return CircularProgressIndicator widget to wait for Consumer
            ? Consumer<List<Place>>(builder: (_, places, __) {
                // Consumer is used to use Provider to retrieve all values from Provider
                return (places !=
                        null) // Check if current index place is not null, if it true, then it will return list of places, otherwise it will return CircularProgressIndicator widget to wait for places to load
                    ? Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height /
                                3, // Height of google map layout
                            width: MediaQuery.of(context)
                                .size
                                .width, // Width of google map layout
                            child: GoogleMap(
                              // GoogleMap widget
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(currentPosition.latitude,
                                      currentPosition.longitude),
                                  zoom: 16.0),
                              zoomGesturesEnabled: true, // Enable zoom feature
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                            child: ListView.builder(
                              // ListView that builder from Consumer to display data retrieved from builder
                              itemCount: places
                                  .length, // Required for total of places for iterable
                              itemBuilder: (context, index) {
                                // places index
                                return FutureProvider(
                                  create: (context) => geoService.getDistance(
                                      currentPosition.latitude,
                                      currentPosition.longitude,
                                      places[index].geometry.location.lat,
                                      places[index]
                                          .geometry
                                          .location
                                          .lng), // Create a provider for Future getDistance() to get distance value return by function
                                  child: Card(
                                    child: ListTile(
                                      title: Text(places[index].name),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Consumer<double>(
                                            // To use FutureProvider value which is distance between current position and place (type: double) that return by Future getDistance
                                            builder: (context, meters, widget) {
                                              // meters (distance) builder from FutureProvider
                                              return (meters != null)
                                                  ? Text(
                                                      // Display place address and distance
                                                      '${places[index].vicinity} \u00b7 ${(meters / 1000).round()} km')
                                                  : Container();
                                            },
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

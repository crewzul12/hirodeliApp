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
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: MediaQuery.of(context).size.height /
                2, // Height of google map layout
            width:
                MediaQuery.of(context).size.width, // Width of google map layout
            child: GoogleMap(
              // GoogleMap widget
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentPosition.latitude, currentPosition.longitude),
                  zoom: 16.0),
              zoomGesturesEnabled: true, // Enable zoom feature
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 15, left: 15, bottom: 20),
              child: Text(
                'New Address',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              )),
          Row(children: [
            Container(
              margin: EdgeInsets.only(left: 15),
              child:
                  Icon(Icons.my_location, color: Color(0xddd60606), size: 19),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set location',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.67,
                    child: Text(
                      'N0.21, Jalan Seri Putra 4/3, Bandar Seri Putra 43000 Kajang Selangor Darul Ehsan',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: GestureDetector(
                  child: Text(
                    'edit',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.deepOrange[700]),
                  ),
                  onTap: () {}),
            ),
          ]),
          Container(
            margin: EdgeInsets.only(top: 15, left: 15, bottom: 20),
            child: Text(
              'Set location',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 15, bottom: 20),
            child: Text(
              'Note to rider',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            ),
          ),
        ])),
      ),
    );
  }
}

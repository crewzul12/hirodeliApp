import 'package:HiroDeli/screens/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:HiroDeli/screens/Cart.dart';
import 'package:HiroDeli/screens/SearchStore.dart';
import 'package:geolocator/geolocator.dart'; // import Geolocator data model
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:HiroDeli/services/geolocator_service.dart';
import 'package:HiroDeli/services/places_service.dart';
import 'package:HiroDeli/screens/Home.dart';
import 'package:HiroDeli/screens/MyAdress.dart';
import 'package:HiroDeli/screens/Login.dart';
import 'package:HiroDeli/screens/Signup.dart';
import 'package:HiroDeli/screens/ForgotPassword.dart';
import 'package:HiroDeli/screens/ResetPasswordSuccess.dart';
import 'package:HiroDeli/screens/GeneralInformation.dart';
import 'package:HiroDeli/screens/MyOrders.dart';
import 'package:HiroDeli/screens/PaymentMethod.dart';
import 'package:HiroDeli/screens/Settings.dart';
import 'package:HiroDeli/screens/ReportIssue.dart';
import 'package:HiroDeli/screens/QrCodeScanner.dart';
import 'package:HiroDeli/screens/Location.dart';
import 'package:HiroDeli/models/address.dart';
import 'package:HiroDeli/models/place.dart'; // import Place data model
import 'dart:convert'
    show json, base64, ascii; // Convert Json string into Json object
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Persistent storage for JWToken

class Mainpage extends StatefulWidget {
  Mainpage(
      this.jwt, this.payload); // Receive jwt from FutureBuilder snapshot.data

  factory Mainpage.fromBase64(String jwt) => Mainpage(
      jwt,
      json.decode(ascii.decode(base64.decode(base64.normalize(jwt.split(".")[
          1]))))); // Split 3 dots from response body into different string and normalize
  // Normalize will do the following:
  // Unescape any %-escapes.
  // Only allow valid characters (A-Z, a-z, 0-9, / and +).
  // Normalize a _ or - character to / or +.
  // Validate that existing padding (trailing = characters) is correct.
  // If no padding exists, add correct padding if necessary and possible.
  // Validate that the length is correct (a multiple of four).
  final String jwt; // Jwt access token
  final Map<String, dynamic>
      payload; // JWT payload from response body into Map structure
  final storage =
      FlutterSecureStorage(); // Flutter secure storage instance for persistent storage
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  final locatorService =
      GeoLocatorService(); // create an instance of GeoLocatorService to use future getLocation() inside FutureProvider
  final placesService =
      PlacesService(); // create an instance of PlacesService to use Future getPlaces() inside ProxyProvider
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // To store all Provider to prevent nested Provider (easy to read)
      providers: [
        FutureProvider(
          create: (context) => locatorService
              .getLocation(), // Create a FutureProvider to retrieve the value return by Future
        ),
        ProxyProvider<Position, Future<List<Place>>>(
          // Combine multiple values that return by multiple providers into a new object and send it back to Provider
          update: (context, position, places) {
            return (position !=
                    null) // Check if position latitude and longitude value is not equal to null, if true it will call Future getPlaces() to return list of places nearby, if it false, then it will return null
                ? placesService.getPlaces(
                    position.latitude,
                    position
                        .longitude) // Call Future by passing current position latitude and longitude as parameter from GeoLocatorService() to PlacesServices() to retrieve all places nearby the current location
                : null;
          },
        )
      ],
      child: MaterialApp(
        routes: <String, WidgetBuilder>{
          // MaterialApp routes
          '/home': (BuildContext context) => Home(), // Home page route
          '/login': (BuildContext context) => Login(), // Login page route
          '/signup': (BuildContext context) => Signup(), // Signup page route
          '/forgotPassword': (BuildContext context) =>
              ForgotPassword(), // ForgotPassword page route
          '/resetPasswordSuccess': (BuildContext context) =>
              ResetPasswordSuccess(), // ResetPasswordSuccess page route
          '/generalInfo': (BuildContext context) =>
              GeneralInformation(), // GeneralInformation page route
          '/profile': (BuildContext context) => Profile(), // Profile page route
          '/searchStore': (BuildContext context) =>
              SearchStore(), // SearchStore page route
          '/cart': (BuildContext context) => Cart(), // Cart page route
          '/myAddress': (BuildContext context) =>
              MyAdress(), // MyAdress page route
          '/myOrders': (BuildContext context) =>
              MyOrders(), // MyOrders page route
          '/paymentMethod': (BuildContext context) =>
              PaymentMethod(), // PaymentMethod page route
          '/settings': (BuildContext context) =>
              Settings(), // Settings page route
          '/reportIssue': (BuildContext context) =>
              ReportIssue(), // ReportIssue page route
          '/qrCodeScanner': (BuildContext context) =>
              QrCodeScanner(), // QrCodeScanner page route
          '/location': (BuildContext context) =>
              Location(), // Location page route
        },
        home: SecondMainpage(),
      ),
    );
  }
}

class SecondMainpage extends StatefulWidget {
  @override
  _SecondMainpageState createState() => _SecondMainpageState();
}

class _SecondMainpageState extends State<SecondMainpage> {
  bool searchActive = false; // Search active state
  List<Address> address = [
    Address(
        index: 0,
        addressType: 'Office',
        addressName:
            'NO.21, Jalan Seri Putra 4/3, Bandar Seri Putra 43000 Kajang Selangor Darul Ehsan'),
    Address(
        index: 1,
        addressType: 'Office',
        addressName:
            'NO.21, Jalan Seri Putra 4/3, Bandar Seri Putra 43000 Kajang Selangor Darul Ehsan'),
  ];
  int locationRange = 0; // Location range default value
  final clearSearchhStoreField =
      TextEditingController(); // Clear text field state
  clearTextInput() {
    clearSearchhStoreField.clear(); // Clear text field method
  }

  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(
        context); // current position with latitude and longitude value from Position generic type that provide by Provider
    final placeProvider = Provider.of<Future<List<Place>>>(
        context); // Retrieve Provider that provide all values from the type, so that it can be created by FutureProvider
    final geoService =
        GeoLocatorService(); // Create instance of GeoLocatorService to use getDistance() method
    return searchActive
        ? Scaffold(
            appBar: PreferredSize(
              child: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        searchActive = false;
                      });
                    }),
                title: Container(
                  child: TextField(
                    controller: clearSearchhStoreField,
                    autofocus: true,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 19),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        onPressed: clearTextInput,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                elevation: 7,
                shadowColor: Colors.grey[300],
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              preferredSize: Size(double.infinity, 60),
            ),
            body: ListView(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(children: <Widget>[
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.my_location,
                          color: Color(0xddd60606),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Current Location',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.73,
                                child: Text(
                                  'NO.21, Jalan Seri Putra 4/3, Bandar Seri Putra 43000 Kajang Selangor Darul Ehsan',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: address.map((addr) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              '${addr.addressType}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '${addr.addressName}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.add,
                              size: 29,
                              color: Color(0xddd60606),
                            ),
                          ),
                          Text(
                            'Add new address',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location maximum range',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Slider(
                                  value: locationRange.toDouble(),
                                  activeColor: Colors.red[800],
                                  inactiveColor: Colors.grey[300],
                                  onChanged: (double value) {
                                    setState(() {
                                      locationRange = value.round();
                                    });
                                  },
                                  min: 0,
                                  max: 20,
                                ),
                              ),
                              Text(
                                "${locationRange}km",
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      )),
                ]),
              ),
            ]),
          )
        : FutureProvider(
            create: (context) =>
                placeProvider, // receive list of place value as Future getPlaces()
            child: MaterialApp(
              routes: <String, WidgetBuilder>{
                // MaterialApp routes
                '/home': (BuildContext context) => Home(), // Home page route
                '/login': (BuildContext context) => Login(), // Login page route
                '/signup': (BuildContext context) =>
                    Signup(), // Signup page route
                '/forgotPassword': (BuildContext context) =>
                    ForgotPassword(), // ForgotPassword page route
                '/resetPasswordSuccess': (BuildContext context) =>
                    ResetPasswordSuccess(), // ResetPasswordSuccess page route
                '/generalInfo': (BuildContext context) =>
                    GeneralInformation(), // GeneralInformation page route
                '/profile': (BuildContext context) =>
                    Profile(), // Profile page route
                '/searchStore': (BuildContext context) =>
                    SearchStore(), // SearchStore page route
                '/cart': (BuildContext context) => Cart(), // Cart page route
                '/myAddress': (BuildContext context) =>
                    MyAdress(), // MyAdress page route
                '/myOrders': (BuildContext context) =>
                    MyOrders(), // MyOrders page route
                '/paymentMethod': (BuildContext context) =>
                    PaymentMethod(), // PaymentMethod page route
                '/settings': (BuildContext context) =>
                    Settings(), // Settings page route
                '/reportIssue': (BuildContext context) =>
                    ReportIssue(), // ReportIssue page route
                '/qrCodeScanner': (BuildContext context) =>
                    QrCodeScanner(), // QrCodeScanner page route
                '/location': (BuildContext context) =>
                    Location(), // Location page route
              },
              home: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: PreferredSize(
                    child: AppBar(
                      title: Container(
                          width: MediaQuery.of(context).size.width * 0.94,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      '/profile'); // Push profile page route
                                },
                                child: SvgPicture.asset(
                                  'assets/logo-food-list.svg',
                                  width: 75,
                                  height: 35,
                                ),
                              ),
                              GestureDetector(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    'NO. 14, jalan pinggiran putra ',
                                    style: TextStyle(
                                      color: Color(0xddd60606),
                                      fontSize: 18.5,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    searchActive = true;
                                  });
                                },
                              ),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      searchActive = true;
                                    });
                                  },
                                  child: Container(
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        '/cart'); // Push cart page route
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: SvgPicture.asset(
                                      'assets/qr-code.svg',
                                      width: 23,
                                      height: 23,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      elevation: 7,
                      shadowColor: Colors.grey[300],
                      backgroundColor: Colors.white,
                      bottom: TabBar(
                        indicatorColor: Color(0xddd60606),
                        labelColor: Color(0xddd60606),
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            child: Text(
                              'Restaurant',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Store',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    preferredSize: Size(double.infinity, 110),
                  ),
                  body: TabBarView(children: [
                    (currentPosition !=
                            null) // Check if current position value that retrieve by Provider is not null, if it true, it will return Consumer widget, otherwise it will return CircularProgressIndicator widget to wait for Consumer
                        ? Consumer<List<Place>>(builder: (_, places, __) {
                            // Consumer is used to use Provider to retrieve all values from Provider
                            return (places !=
                                    null) // Check if current index place is not null, if it true, then it will return list of places, otherwise it will return CircularProgressIndicator widget to wait for places to load
                                ? Column(
                                    children: [
                                      // Container(
                                      //   height: MediaQuery.of(context).size.height /
                                      //       3, // Height of google map layout
                                      //   width: MediaQuery.of(context)
                                      //       .size
                                      //       .width, // Width of google map layout
                                      //   child: GoogleMap(
                                      //     // GoogleMap widget
                                      //     initialCameraPosition: CameraPosition(
                                      //         target: LatLng(
                                      //             currentPosition.latitude,
                                      //             currentPosition.longitude),
                                      //         zoom: 16.0),
                                      //     zoomGesturesEnabled:
                                      //         true, // Enable zoom feature
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 10.0,
                                      // ),
                                      Expanded(
                                        child: ListView.builder(
                                          // ListView that builder from Consumer to display data retrieved from builder
                                          itemCount: places
                                              .length, // Required for total of places for iterable
                                          itemBuilder: (context, index) {
                                            // places index
                                            return FutureProvider(
                                              create: (context) =>
                                                  geoService.getDistance(
                                                      currentPosition.latitude,
                                                      currentPosition.longitude,
                                                      places[index]
                                                          .geometry
                                                          .location
                                                          .lat,
                                                      places[index]
                                                          .geometry
                                                          .location
                                                          .lng), // Create a provider for Future getDistance() to get distance value return by function
                                              child: Container(
                                                margin: index == 0
                                                    ? EdgeInsets.only(
                                                        top: 15, bottom: 8)
                                                    : EdgeInsets.only(
                                                        bottom: 8),
                                                child: Center(
                                                  child: Card(
                                                    elevation: 5,
                                                    shadowColor:
                                                        Colors.lightBlue[50],
                                                    child: InkWell(
                                                      splashColor: Colors.red
                                                          .withAlpha(30),
                                                      onTap: () {
                                                        print('Card tapped.');
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.92,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 16),
                                                        height: 100,
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 12.0,
                                                              ),
                                                              Text(
                                                                places[index]
                                                                    .name,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              Consumer<double>(
                                                                  // To use FutureProvider value which is distance between current position and place (type: double) that return by Future getDistance
                                                                  builder: (context,
                                                                      meters,
                                                                      widget) {
                                                                // meters (distance) builder from FutureProvider
                                                                return (meters !=
                                                                        null)
                                                                    ? Text(
                                                                        '${(meters / 1000).toStringAsFixed(2)}km',
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color: Colors.blueGrey[
                                                                                200],
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ) // Display place distance
                                                                    : Container();
                                                              })
                                                            ]),
                                                      ),
                                                    ),
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
                    Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/face-icon.svg',
                                width: 55, height: 55),
                            SizedBox(
                              height: 25.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                "Sorry, there's still no vendor in this region",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0x999f9f9f),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ]),
                    ),
                  ]),
                ),
              ),
            ));
  }
}

// Card(
//                                             elevation: 4,
//                                             shadowColor: Colors.blueGrey[50],
//                                             child: ListTile(
//                                               title: Text(places[index].name),
//                                               subtitle: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   SizedBox(
//                                                     height: 5.0,
//                                                   ),
//                                                   Consumer<double>(
//                                                     // To use FutureProvider value which is distance between current position and place (type: double) that return by Future getDistance
//                                                     builder: (context, meters,
//                                                         widget) {
//                                                       // meters (distance) builder from FutureProvider
//                                                       return (meters != null)
//                                                           ? Text(
//                                                               // Display place distance
//                                                               '${(meters / 1000).round()} km')
//                                                           : Container();
//                                                     },
//                                                   ),
//                                                   SizedBox(
//                                                     height: 5.0,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           )

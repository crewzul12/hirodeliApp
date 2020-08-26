import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:HiroDeli/models/bazaar.dart';
import 'package:HiroDeli/models/restaurant.dart';

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List<Restaurant> restaurant = [
    Restaurant(
        imagePath: 'assets/restaurant1.png',
        name: 'Nasi Kandar Haji Tapah',
        distance: 15.00,
        deliveryTime: 30,
        deliveryFee: 3.99),
    Restaurant(
        imagePath: 'assets/restaurant1.png',
        name: 'Nasi Kandar Haji Tapah',
        distance: 15.00,
        deliveryTime: 30,
        deliveryFee: 3.99),
    Restaurant(
        imagePath: 'assets/restaurant1.png',
        name: 'Nasi Kandar Haji Tapah',
        distance: 15.00,
        deliveryTime: 30,
        deliveryFee: 3.99),
    Restaurant(
        imagePath: 'assets/restaurant1.png',
        name: 'Nasi Kandar Haji Tapah',
        distance: 15.00,
        deliveryTime: 30,
        deliveryFee: 3.99),
    Restaurant(
        imagePath: 'assets/restaurant1.png',
        name: 'Nasi Kandar Haji Tapah',
        distance: 15.00,
        deliveryTime: 30,
        deliveryFee: 3.99),
    Restaurant(
        imagePath: 'assets/restaurant1.png',
        name: 'Nasi Kandar Haji Tapah',
        distance: 15.00,
        deliveryTime: 30,
        deliveryFee: 3.99),
  ];
  List<Bazaar> bazaar = [
    // Bazaar(
    //     imagePath: 'assets/restaurant1.png',
    //     name: 'Nasi Kandar Haji Tapah',
    //     distance: 15.00,
    //     deliveryTime: 30,
    //     deliveryFee: 3.99),
    // Bazaar(
    //     imagePath: 'assets/restaurant1.png',
    //     name: 'Nasi Kandar Haji Tapah',
    //     distance: 15.00,
    //     deliveryTime: 30,
    //     deliveryFee: 3.99),
    // Bazaar(
    //     imagePath: 'assets/restaurant1.png',
    //     name: 'Nasi Kandar Haji Tapah',
    //     distance: 15.00,
    //     deliveryTime: 30,
    //     deliveryFee: 3.99),
    // Bazaar(
    //     imagePath: 'assets/restaurant1.png',
    //     name: 'Nasi Kandar Haji Tapah',
    //     distance: 15.00,
    //     deliveryTime: 30,
    //     deliveryFee: 3.99),
    // Bazaar(
    //     imagePath: 'assets/restaurant1.png',
    //     name: 'Nasi Kandar Haji Tapah',
    //     distance: 15.00,
    //     deliveryTime: 30,
    //     deliveryFee: 3.99),
    // Bazaar(
    //     imagePath: 'assets/restaurant1.png',
    //     name: 'Nasi Kandar Haji Tapah',
    //     distance: 15.00,
    //     deliveryTime: 30,
    //     deliveryFee: 3.99),
  ];

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            child: AppBar(
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/profile');
                      },
                      child: SvgPicture.asset(
                        'assets/logo-food-list.svg',
                        width: 75,
                        height: 35,
                      ),
                    ),
                    Text(
                      'NO. 14, jalan ping...',
                      style: TextStyle(
                        color: Color(0xddd60606),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/searchStore');
                          },
                          child: Container(
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/cart');
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
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
                      'Bazaar',
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
          body: TabBarView(
            children: [
              restaurant.isEmpty
                  ? ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: GlowingOverscrollIndicator(
                        axisDirection: AxisDirection.down,
                        color: Colors.red.withAlpha(30),
                        child: ListView(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 200),
                              child: Column(children: [
                                SvgPicture.asset(
                                  'assets/face-icon.svg',
                                  width: 52,
                                  height: 52,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 10, right: 100, left: 100),
                                  child: Text(
                                    "Sorry, there's still no vendor in this region",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                    )
                  : ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: GlowingOverscrollIndicator(
                        axisDirection: AxisDirection.down,
                        color: Colors.red.withAlpha(30),
                        child: ListView(
                          padding: const EdgeInsets.only(
                              top: 20, right: 10, bottom: 40, left: 10),
                          children: restaurant.map((res) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 6),
                              width: MediaQuery.of(context).size.width * 0.93,
                              height: MediaQuery.of(context).size.height * 0.33,
                              child: Card(
                                elevation: 4,
                                shadowColor: Colors.teal[50],
                                child: InkWell(
                                  splashColor: Colors.red.withAlpha(30),
                                  onTap: () {},
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: Column(children: <Widget>[
                                          Image.asset(
                                            '${res.imagePath}',
                                            fit: BoxFit.cover,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 13, left: 19),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${res.name}',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${res.distance.toStringAsFixed(2)}km',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.grey[400]),
                                                    ),
                                                    Text(
                                                      ' | ',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.grey[400]),
                                                    ),
                                                    Text(
                                                      '${res.deliveryTime}min',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.grey[400]),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'RM${res.deliveryFee.toStringAsFixed(2)} ',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Delivery Fee',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.grey[400]),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                      ),
                                      Positioned(
                                        bottom: 70,
                                        right: 28,
                                        child: SvgPicture.asset(
                                          'assets/logo-food-list.svg',
                                          width: 95,
                                          height: 55,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
              bazaar.isEmpty
                  ? ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: GlowingOverscrollIndicator(
                        axisDirection: AxisDirection.down,
                        color: Colors.red.withAlpha(30),
                        child: ListView(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 200),
                              child: Column(children: [
                                SvgPicture.asset(
                                  'assets/face-icon.svg',
                                  width: 52,
                                  height: 52,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 10, right: 100, left: 100),
                                  child: Text(
                                    "Sorry, there's still no vendor in this region",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                    )
                  : ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: GlowingOverscrollIndicator(
                        axisDirection: AxisDirection.down,
                        color: Colors.red.withAlpha(30),
                        child: ListView(
                          padding: const EdgeInsets.only(
                              top: 20, right: 10, bottom: 40, left: 10),
                          children: bazaar.map((baz) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 6),
                              width: MediaQuery.of(context).size.width * 0.93,
                              height: MediaQuery.of(context).size.height * 0.33,
                              child: Card(
                                elevation: 4,
                                shadowColor: Colors.teal[50],
                                child: InkWell(
                                  splashColor: Colors.red.withAlpha(30),
                                  onTap: () {},
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: Column(children: <Widget>[
                                          Image.asset(
                                            '${baz.imagePath}',
                                            fit: BoxFit.cover,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 13, left: 19),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${baz.name}',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${baz.distance.toStringAsFixed(2)}km',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.grey[400]),
                                                    ),
                                                    Text(
                                                      ' | ',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.grey[400]),
                                                    ),
                                                    Text(
                                                      '${baz.deliveryTime}min',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.grey[400]),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'RM${baz.deliveryFee.toStringAsFixed(2)} ',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Delivery Fee',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.grey[400]),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                      ),
                                      Positioned(
                                        bottom: 70,
                                        right: 28,
                                        child: SvgPicture.asset(
                                          'assets/logo-food-list.svg',
                                          width: 95,
                                          height: 55,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

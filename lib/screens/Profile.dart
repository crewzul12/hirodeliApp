import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Color(0xddd60606),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 29,
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        color: Colors.white,
        child: Column(children: [
          Container(
            child: Card(
              elevation: 9,
              shadowColor: Colors.teal[50],
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.of(context).pushNamed('/generalInfo');
                },
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: 67,
                  child: Text(
                    'General informations',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Card(
              elevation: 9,
              shadowColor: Colors.teal[50],
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.of(context).pushNamed('/myOrders');
                },
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: 67,
                  child: Text(
                    'My orders',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Card(
              elevation: 9,
              shadowColor: Colors.teal[50],
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.of(context).pushNamed('/paymentMethod');
                },
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: 67,
                  child: Text(
                    'Payment method',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Card(
              elevation: 9,
              shadowColor: Colors.teal[50],
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: 67,
                  child: Text(
                    'Share to friends',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Card(
              elevation: 9,
              shadowColor: Colors.teal[50],
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.of(context).pushNamed('/settings');
                },
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: 67,
                  child: Text(
                    'Settings',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

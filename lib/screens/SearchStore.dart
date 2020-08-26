import 'package:flutter/material.dart';
import 'package:HiroDeli/models/address.dart';

class SearchStore extends StatefulWidget {
  @override
  _SearchStoreState createState() => _SearchStoreState();
}

class _SearchStoreState extends State<SearchStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
  int locationRange = 0;
  final clearSearchhStoreField = TextEditingController();
  clearTextInput() {
    clearSearchhStoreField.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Container(
            child: TextField(
              controller: clearSearchhStoreField,
              autofocus: true,
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Poppins', fontSize: 19),
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
    );
  }
}

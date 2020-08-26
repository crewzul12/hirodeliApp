import 'package:flutter/material.dart';
import 'package:HiroDeli/models/address.dart';

class MyAdress extends StatefulWidget {
  @override
  _MyAdressState createState() => _MyAdressState();
}

class _MyAdressState extends State<MyAdress> {
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
    Address(
        index: 2,
        addressType: 'Home',
        addressName:
            'NO.21, Jalan Seri Putra 4/3, Bandar Seri Putra 43000 Kajang Selangor Darul Ehsan'),
  ];
  int id = 0; // Default value for radio button
  String addressType = ''; // Default value for radio button
  String addressName = ''; // Default value for radio button
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Address',
          style: TextStyle(
            color: Color(0xddd60606),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xddd60606),
        child: Icon(
          Icons.add,
          size: 42,
        ),
        onPressed: () {},
      ),
      body: Container(
        child: ListView(
          children: address.map((addr) {
            return Container(
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Radio(
                              activeColor: Color(0xddd60606),
                              value: addr.index,
                              groupValue: id,
                              onChanged: (value) {
                                setState(() {
                                  addressType = addr.addressType;
                                  addressName = addr.addressName;
                                  id = addr.index;
                                });
                              }),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${addr.addressType}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '${addr.addressName}',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 7),
                          child: IconButton(
                              icon: Icon(Icons.edit), onPressed: () {}),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * 0.91,
                      child: Divider(
                        color: Colors.grey[400],
                        height: 0,
                        thickness: 1.5,
                        indent: 0,
                        endIndent: 4,
                      ),
                    ),
                  ],
                ));
          }).toList(),
        ),
      ),
    );
  }
}

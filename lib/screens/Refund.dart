import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:HiroDeli/models/order.dart';

class Refund extends StatefulWidget {
  @override
  _RefundState createState() => _RefundState();
}

class _RefundState extends State<Refund> {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
  List<Order> order = [
    Order(
        vendorName: 'Nasi Kandar Haji Tapah',
        orderDateTime: DateTime.parse('2020-03-17 13:00'),
        orderStatus: 'Reorder'),
    Order(
        vendorName: 'Nasi Kandar Haji Tapah',
        orderDateTime: DateTime.parse('2020-03-17 13:00'),
        orderStatus: 'Reorder'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Refund',
          style: TextStyle(
            color: Color(0xddd60606),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Color(0xfff7f7f7),
        child: ListView(
            padding: EdgeInsets.only(bottom: 70),
            children: order.map((ord) {
              return Container(
                margin: EdgeInsets.only(top: 8, right: 10, left: 10),
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.teal[50],
                  child: InkWell(
                    splashColor: Colors.red.withAlpha(30),
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Text(
                                  '${ord.vendorName}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                '${dateFormat.format(ord.orderDateTime)}',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          ord.orderStatus == 'Reorder'
                              ? Container(
                                  width: 92,
                                  height: 30,
                                  child: FlatButton(
                                      onPressed: () {},
                                      color: Colors.lightBlue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        '${ord.orderStatus}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500),
                                      )),
                                )
                              : ord.orderStatus == 'Delivering...' ||
                                      ord.orderStatus == 'Pending'
                                  ? Text(
                                      '${ord.orderStatus}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                    )
                                  : ord.orderStatus == 'Cancelled' ||
                                          ord.orderStatus == 'Refunded'
                                      ? Text(
                                          '${ord.orderStatus}',
                                          style: TextStyle(
                                              color: Color(0xddd60606),
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500),
                                        )
                                      : ord.orderStatus == 'Rejected'
                                          ? Text(
                                              '${ord.orderStatus}',
                                              style: TextStyle(
                                                  color: Color(0xddd60606),
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500),
                                            )
                                          : null
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}

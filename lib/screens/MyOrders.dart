import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:HiroDeli/models/order.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
  List<Order> order = [
    Order(
        vendorName: 'Nasi Kandar Haji Tapah',
        orderNo: 'HD001',
        tableNo: 'T12',
        orderStatus: 'Preparing'),
    Order(
        vendorName: 'Nasi Kandar Haji Tapah',
        orderNo: 'HD001',
        tableNo: null,
        orderStatus: 'Ready'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Orders',
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
                  color: ord.orderStatus == 'Preparing'
                      ? null
                      : ord.orderStatus == 'Ready'
                          ? Color(0xddd60606)
                          : null,
                  elevation: 4,
                  shadowColor: Colors.teal[50],
                  child: InkWell(
                    splashColor: Colors.red.withAlpha(30),
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      color: ord.orderStatus == 'Preparing'
                                          ? null
                                          : ord.orderStatus == 'Ready'
                                              ? Colors.white
                                              : null,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${ord.orderNo}',
                                    style: TextStyle(
                                        color: ord.orderStatus == 'Preparing'
                                            ? null
                                            : ord.orderStatus == 'Ready'
                                                ? Colors.white
                                                : null,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  ord.tableNo != null
                                      ? Text(
                                          ' | ${ord.tableNo}',
                                          style: TextStyle(
                                              color: ord.orderStatus ==
                                                      'Preparing'
                                                  ? null
                                                  : ord.orderStatus == 'Ready'
                                                      ? Colors.white
                                                      : null,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500),
                                        )
                                      : Container()
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '${ord.orderStatus}',
                            style: TextStyle(
                                color: ord.orderStatus == 'Preparing'
                                    ? null
                                    : ord.orderStatus == 'Ready'
                                        ? Colors.white
                                        : null,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
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

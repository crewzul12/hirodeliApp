import 'package:flutter/material.dart';
import 'package:HiroDeli/models/order.dart';
import 'package:provider/provider.dart'; // import order data model

class MyOrders extends StatefulWidget {
  // Create a stateful widget
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
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
    return MultiProvider(
      providers: [
        Provider(create: (context) => Order()) // Create a Provider to retrieve all values from Order data model
      ],
      child: Scaffold(
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
            child: Consumer<List<Order>>(builder: (_, order, __) { // Consume to use and display all values from Order
              return ListView.builder(
                // ListView that builder from Consumer to display data retrieved from builder
                itemCount:
                    order.length, // Required for total of places for iterable
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 8, right: 10, left: 10),
                    child: Card(
                      color: order[index].orderStatus == 'Preparing'
                          ? null
                          : order[index].orderStatus == 'Ready'
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
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      '${order[index].vendorName}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: order[index].orderStatus ==
                                                  'Preparing'
                                              ? null
                                              : order[index].orderStatus ==
                                                      'Ready'
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
                                        '${order[index].orderNo}',
                                        style: TextStyle(
                                            color: order[index].orderStatus ==
                                                    'Preparing'
                                                ? null
                                                : order[index].orderStatus ==
                                                        'Ready'
                                                    ? Colors.white
                                                    : null,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500),
                                      ),
                                      order[index].tableNo != null
                                          ? Text(
                                              ' | ${order[index].tableNo}',
                                              style: TextStyle(
                                                  color: order[index]
                                                              .orderStatus ==
                                                          'Preparing'
                                                      ? null
                                                      : order[index]
                                                                  .orderStatus ==
                                                              'Ready'
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
                                '${order[index].orderStatus}',
                                style: TextStyle(
                                    color: order[index].orderStatus ==
                                            'Preparing'
                                        ? null
                                        : order[index].orderStatus == 'Ready'
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
                },
              );
            })),
      ),
    );
  }
}

// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    Order({
        this.vendorName,
        this.tableNo,
        this.orderNo,
        this.orderStatus,
    }); // Constructor

    String vendorName; // Vendor name
    String tableNo; // Table number
    String orderNo; // Order number
    String orderStatus; // Order status such as ready or preparing

    factory Order.fromJson(Map<String, dynamic> json) => Order( // Constructing a new Order instance from Map structure
        vendorName: json["vendorName"], // initialize Map key named "vendorName" into Order vendorName
        tableNo: json["tableNo"], // initialize Map key named "tableNo" into Order tableNo
        orderNo: json["orderNo"], // initialize Map key named "orderNo" into Order orderNo
        orderStatus: json["orderStatus"], // initialize Map key named "orderStatus" into Order orderStatus
    );

    Map<String, dynamic> toJson() => { // Convert Order instance into Map
        "vendorName": vendorName,
        "tableNo": tableNo,
        "orderNo": orderNo,
        "orderStatus": orderStatus,
    };
}

import 'package:HiroDeli/models/onlineBanking.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  List<OnlineBanking> onlineBanking = [
    OnlineBanking(bankName: 'Maybank2U'),
    OnlineBanking(bankName: 'Bank Simpanan Nasional'),
    OnlineBanking(bankName: 'Bank Islam'),
    OnlineBanking(bankName: 'CIMB Clicks'),
    OnlineBanking(bankName: 'AFFiNBANK'),
    OnlineBanking(bankName: 'RHBNow'),
    OnlineBanking(bankName: 'OCBC Bank'),
    OnlineBanking(bankName: 'Bank Muamalat'),
  ];
  String currentOnlineBanking = 'Choose your online banking';
  bool isExpanded = false;
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Method',
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
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.only(top: 20),
            children: [
              Column(
                children: [
                  ListTile(
                    leading: Image.asset(
                      'assets/logo-fpx.png',
                      width: 29,
                      height: 29,
                    ),
                    title: Text(
                      'Online banking',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: ListTileTheme(
                      contentPadding: EdgeInsets.all(0),
                      selectedColor: Colors.white,
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.all(0),
                        childrenPadding: EdgeInsets.all(0),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        trailing: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 29,
                        ),
                        key: GlobalKey(),
                        title: Text(
                          '$currentOnlineBanking',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                        children: onlineBanking.map((bank) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                currentOnlineBanking = bank.bankName;
                              });
                              isExpanded = false;
                            },
                            child: ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                '${bank.bankName}',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        }).toList(),
                        initiallyExpanded: isExpanded,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 17, left: 17, bottom: 15),
                    child: Divider(
                      color: Colors.grey[400],
                      height: 0,
                      thickness: 1.5,
                      indent: 0,
                      endIndent: 4,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.credit_card,
                      color: Colors.deepOrange[600],
                    ),
                    title: Text(
                      'Credit / Debit Card',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 7),
                          width: MediaQuery.of(context).size.width * 1.0,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                isDense: true,
                                prefixIcon: Icon(Icons.add, size: 30),
                                prefixIconConstraints:
                                    BoxConstraints(minWidth: 0, maxHeight: 30),
                                hintText: 'Add New Card',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, right: 7, bottom: 15),
                          child: Text(
                            'I acknowledge that by saving my card, One Time Password (OTP) might not be required for transaction on HiroDeli',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 17, left: 17),
                    child: Divider(
                      color: Colors.grey[400],
                      height: 0,
                      thickness: 1.5,
                      indent: 0,
                      endIndent: 4,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/boost-e-wallet.png',
                      width: 20,
                      height: 20,
                    ),
                    title: Text(
                      'Boost wallet',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 17, left: 17),
                    child: Divider(
                      color: Colors.grey[400],
                      height: 0,
                      thickness: 1.5,
                      indent: 0,
                      endIndent: 4,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/kiplepay.png',
                      width: 29,
                      height: 29,
                    ),
                    title: Text(
                      'KiplePay',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 17, left: 17),
                    child: Divider(
                      color: Colors.grey[400],
                      height: 0,
                      thickness: 1.5,
                      indent: 0,
                      endIndent: 4,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/grabpay.png',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'GrabPay',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 17, left: 17),
                    child: Divider(
                      color: Colors.grey[400],
                      height: 0,
                      thickness: 1.5,
                      indent: 0,
                      endIndent: 4,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/touchngo.png',
                      width: 26,
                      height: 26,
                    ),
                    title: Text(
                      'TouchnGo Pay',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 17, left: 17),
                    child: Divider(
                      color: Colors.grey[400],
                      height: 0,
                      thickness: 1.5,
                      indent: 0,
                      endIndent: 4,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/maybankqrpay.png',
                      width: 24,
                      height: 24,
                    ),
                    title: Text(
                      'Maybank QRPAY',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 17, left: 17, bottom: 120),
                    child: Divider(
                      color: Colors.grey[400],
                      height: 0,
                      thickness: 1.5,
                      indent: 0,
                      endIndent: 4,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: FlatButton(
                  color: Color(0xddd60606),
                  padding: EdgeInsets.all(18),
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  onPressed: () {},
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'UPDATE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

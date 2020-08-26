import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReportIssue extends StatefulWidget {
  @override
  _ReportIssueState createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report an issue',
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
        width: MediaQuery.of(context).size.width * 1.0,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 15),
              child:
                  SvgPicture.asset('assets/rider.svg', width: 300, height: 200),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  margin: EdgeInsets.only(bottom: 13, left: 15),
                  child: Text(
                    'Your message',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 9, right: 9),
                  height: 150,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        side: new BorderSide(
                            color: Color(0x77707070), width: 2.0),
                        borderRadius: BorderRadius.circular(4.0)),
                    elevation: 2,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'What would you like to report?',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        maxLength: 1000,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  margin: EdgeInsets.only(top: 13, left: 15),
                  child: Text(
                    'Thank you for your report. We will reach back to you as soon as we can within 2-6 working days',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: FlatButton(
        color: Color(0xddd60606),
        padding: EdgeInsets.all(18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        onPressed: () {},
        child: SizedBox(
          width: double.maxFinite,
          child: Text(
            'SUBMIT',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}

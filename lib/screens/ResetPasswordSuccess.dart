import 'package:flutter/material.dart';

class ResetPasswordSuccess extends StatefulWidget {
  @override
  _ResetPasswordSuccessState createState() => _ResetPasswordSuccessState();
}

class _ResetPasswordSuccessState extends State<ResetPasswordSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffffffff),
      body: Container(
        margin: EdgeInsets.only(top: 150),
        child: Column(
          children: [
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Done!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Check your email.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: FlatButton(
                  color: Color(0xddd60606),
                  padding: EdgeInsets.all(18),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'LOG IN',
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
            ),
          ],
        ),
      ),
    );
  }
}

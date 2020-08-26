import 'package:flutter/material.dart';

class SignupName extends StatefulWidget {
  @override
  _SignupNameState createState() => _SignupNameState();
}

class _SignupNameState extends State<SignupName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color(0xffffffff),
        title: Text('Signup Name page'),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "What's your name?",
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
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter your first name',
                        labelText: 'First name',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter your last name',
                        labelText: 'Last name',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
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
                    Navigator.of(context).pushNamed('/signupPhoneNum');
                  },
                  shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'NEXT',
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

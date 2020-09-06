import 'package:HiroDeli/screens/SignupEmailPass.dart';
import 'package:flutter/material.dart';

class SignupPhoneNum extends StatefulWidget {
  final String firstName; // First name retrieved from Signup page
  final String lastName; // Last name retrieved from Signup page
  SignupPhoneNum(this.firstName,
      this.lastName); // Constructor to receive parameters that passed by Signup through Navigator
  @override
  State<StatefulWidget> createState() {
    return _SignupPhoneNumState(this.firstName,
        this.lastName); // Return Constructor for SignupPhoneNum state
  }
}

class _SignupPhoneNumState extends State<SignupPhoneNum> {
  final String firstName; // First name retrieved from Signup page
  final String lastName; // Last name retrieved from Signup
  _SignupPhoneNumState(this.firstName,
      this.lastName); // Constructor to receive parameters from SignupPhoneNum
  final TextEditingController phoneNumController =
      new TextEditingController(); // Handle phone number input text field

  bool validatePhoneNum = false; // Validation for phone number
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
        title: Text('Signup Phone Number page'),
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
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Nice to meet you $firstName",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: Text(
                      "How can we keep in touch?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: TextFormField(
                      controller: phoneNumController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                        labelText: 'Phone number',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        errorText:
                            validatePhoneNum ? "Form can't be empty" : null,
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
                    if (phoneNumController.text.isEmpty) {
                      setState(() {
                        validatePhoneNum = true;
                      });
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupEmailPass(firstName,
                                  lastName, phoneNumController.text)));
                    }
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

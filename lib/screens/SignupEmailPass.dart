import 'package:flutter/material.dart';

class SignupEmailPass extends StatefulWidget {
  final String firstName; // First name retrieved from SignupPhoneNum page
  final String lastName; // Last name retrieved from SignupPhoneNum page
  final String phoneNum; // Phone number retrieved from SignupPhoneNum page
  SignupEmailPass(this.firstName, this.lastName,
      this.phoneNum); // Constructor to receive parameters that passed by Signup through Navigator
  @override
  State<StatefulWidget> createState() {
    return _SignupEmailPassState(this.firstName, this.lastName,
        this.phoneNum); // Return Constructor for SignupEmailPass state
  }
}

class _SignupEmailPassState extends State<SignupEmailPass> {
  final String firstName; // First name retrieved from SignupPhoneNum page
  final String lastName; // Last name retrieved from SignupPhoneNum page
  final String phoneNum; // Phone number retrieved from SignupPhoneNum page
  _SignupEmailPassState(this.firstName, this.lastName,
      this.phoneNum); // Constructor to receive parameters from SignupEmailPass
  final TextEditingController emailController =
      new TextEditingController(); // Handle email input field
  final TextEditingController passwordController =
      new TextEditingController(); // Handle password input field
  bool validateEmail = false; // Validation for email
  bool validatePassword = false; // Validation for password
  bool _obscuredPasswordText = true; // hide text in form field for password
  void _togglePassword() {
    // Toggle hide and show password
    setState(() {
      _obscuredPasswordText = !_obscuredPasswordText;
    });
  }

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
                      "Lastly, please enter your email and password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Psst, keep your password a secret",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          " 😉 ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Enter your email address',
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        errorText: validateEmail ? "Form can't be empty" : null,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscuredPasswordText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: _togglePassword,
                          color: Colors.grey,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        errorText:
                            validatePassword ? "Form can't be empty" : null,
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
                    if (emailController.text.isEmpty) { // Check if email input is empty or not
                      setState(() {
                        validateEmail = true; // set show error field for email to true
                      });
                    } else if (passwordController.text.isEmpty) { //Check if password input is empty or not
                      setState(() {
                        validatePassword = true; // set show error field for password to true
                      });
                    } else if (emailController.text.isEmpty &
                        passwordController.text.isEmpty) { // Check both input is empty or not
                      setState(() {
                        validateEmail = true; // set show error field for email to true
                        validatePassword = true; // set show error field for password to true
                      });
                    }
                  },
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'REGISTER',
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

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscuredText =
      true; // hide text in form field for password // Variable for password
  void _toggle() {
    setState(() {
      _obscuredText = !_obscuredText;
    });
  }

  TextEditingController emailController =
      new TextEditingController(); // Handle changes in textfield and callback logIn function
  TextEditingController passwordController = new TextEditingController();

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
        title: Text('Login page'),
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
                      'Log In',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscuredText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: _toggle,
                          color: Colors.grey,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        } else if (value.length < 6) {
                          return 'Password too short';
                        }
                        return null;
                      },
                      obscureText: _obscuredText,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Center(
                      child: GestureDetector(
                        // When the child is tapped, show a snackbar.
                        onTap: () {
                          Navigator.of(context).pushNamed('/forgotPassword');
                        },
                        // The custom button
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 13,
                          ),
                        ),
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
                  color: Colors.lightBlue,
                  padding: EdgeInsets.all(18),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/location');
                  },
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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

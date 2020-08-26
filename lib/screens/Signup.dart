import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscuredPasswordText = true;
  bool _obscuredConfirmPasswordText =
      true; // hide text in form field for password // Variable for password
  void _togglePassword() {
    setState(() {
      _obscuredPasswordText = !_obscuredPasswordText;
    });
  }

  void _toggleConfirmPassword() {
    setState(() {
      _obscuredConfirmPasswordText = !_obscuredConfirmPasswordText;
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
        title: Text('Signup page'),
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
                      'Sign Up',
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
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
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
                      obscureText: _obscuredPasswordText,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        labelText: 'Confirm Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscuredConfirmPasswordText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: _toggleConfirmPassword,
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
                      obscureText: _obscuredConfirmPasswordText,
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
                    Navigator.of(context).pushNamed('/signupName');
                  },
                  shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'SIGN UP',
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

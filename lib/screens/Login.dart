import 'package:HiroDeli/models/jwtoken.dart';
import 'package:HiroDeli/screens/MainPage.dart';
import 'package:HiroDeli/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Persistent storage for JWToken

final storage =
    FlutterSecureStorage(); // Flutter secure storage instance for persistent storage

class Login extends StatefulWidget {
  // Create a stateful widget that can be changed
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscuredText =
      true; // hide text in form field for password // Variable for password
  void _toggle() {
    // Function toggle hide and show password
    setState(() {
      _obscuredText = !_obscuredText;
    });
  }

  @override
  void initState() {
    // Initialize state when creating the widget
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void displayDialog(context, title, text) => showDialog(
        // Function for display dialog error widget when token is null
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  final loginService =
      LoginService(); // Access Future loginUser method from LoginService() instance

  final TextEditingController emailController =
      new TextEditingController(); // Handle email input textfield
  final TextEditingController passwordController =
      new TextEditingController(); // Handle password input textfield

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
                          fontWeight: FontWeight.w500,
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
                          fontWeight: FontWeight.w500,
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
                  onPressed: () async {
                    var email = emailController
                        .text; // retrive email value that user input inside textfield
                    var password = passwordController
                        .text; // retrive password value that user input inside textfield
                    final JwToken jwtoken = await loginService.loginUser(email,
                        password); // Call Future loginUser to retrieve JwToken model

                    if (jwtoken != null) {
                      // Check if user has jwtoken model or not from response body
                      storage.write(
                          key: 'jwt',
                          value: jwtoken
                              .access); // Store jwtoken into persistent storage key named jwt

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>
                                  Mainpage.fromBase64(jwtoken.access)),
                          (Route<dynamic> route) =>
                              false); // Remove all previous routes
                    } else {
                      // If token is null then display dialog error
                      displayDialog(context, "An Error Occurred",
                          "No account was found matching that username and password");
                    }
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

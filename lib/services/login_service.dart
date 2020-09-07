import 'package:HiroDeli/models/jwtoken.dart';
import 'package:http/http.dart'
    as http; // Http client package for request and response
class LoginService {
  JwToken token; // JwToken instance to store token
  Future<JwToken> loginUser(String email, String password) async {
    // Future for loginUser return a specified value
    var res = await http.post(
        'https://jwt-test-login.herokuapp.com/api/login/', // POST request to retrieve token by sending email and password at body of the request
        headers: {
          "X-Hiro-Deli-Api-Auth-X": "dUzhUW49.mzskx1G7fxnJTSgkVVtsgj4vpwcDf11v"
        },
        body: {
          "email": email,
          "password": password,
        });
    print(res.body);
    if (res.statusCode == 200) {
      // Check if response status code is 200 (Ok) return response body data
      final String responseString = res.body; // Response token string
      return jwTokenFromJson(
          responseString); // Return parse json into JwToken instance
    } else {
      return null;
    }
  }
}
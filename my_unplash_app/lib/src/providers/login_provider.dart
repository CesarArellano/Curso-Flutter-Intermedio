import 'dart:convert';

import 'package:http/http.dart' as http;

final urlAPI = 'https://my-unsplash-api.vercel.app';

class LoginProvider {
  Future autenticacionLogin(String username, String password) async {
    
    final urlAutenticacion = Uri.parse('$urlAPI/api/users/sign_in/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    final response = await http.post(
      urlAutenticacion,
      headers: {
        "Authorization": basicAuth
      }
    );

    final Map<String, dynamic> decodedData = json.decode(response.body);
    print(decodedData);

  }
}
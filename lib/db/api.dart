import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

final urlServer = 'http://10.0.2.2:3000/usuario';

//Nuevo Usuario
Future<http.Response> newUserDB(email, pass) async {
  var body = json.encode({
    'email': email,
    'pass' : pass
  });
  var response;
  try {
    response = await http.post(urlServer,
      headers: {"Content-Type": "application/json"},
      body: body
    );
    print("${response.statusCode}");
    print("${response.body}");
    
  } catch (e) {
    print(e);
  }

  return response;
}

//Validamos Usuario
Future<http.Response> loginDB(email, pass) async {
  var body = json.encode({
    'email': email,
    'pass' : pass,
    'consulta': true
  });
  var response;
  try {
    response = await http.post(urlServer,
      headers: {"Content-Type": "application/json"},
      body: body
    );
    print("${response.statusCode}");
    print("${response.body}");
    
  } catch (e) {
    print(e);
  }

  return response;
}

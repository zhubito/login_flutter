import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_flutter/model/user.dart';

final urlServer = 'http://10.0.2.2:3000/';

Future<User> fetchUser() async {
  var response = await http.get(urlServer);

  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    print(response.body);
    return User.fromJson(json.decode(response.body));
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future<String> fetchData() async {
  var response = await http.get(urlServer);

  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    return (response.body);
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

// Future<User> newUser(email, pass) async {
//   var response = await http.get(urlServer+'/usuario');

//   if (response.statusCode == 200) {
//     // Si la llamada al servidor fue exitosa, analiza el JSON
//     print(response.body);
//     return User.fromJson(json.decode(response.body));
//   } else {
//     // Si la llamada no fue exitosa, lanza un error.
//     throw Exception('Failed to load post');
//   }
// }

Future<http.Response> newUser(email, pass) async {

  var body = json.encode({
    'email': email,
    'pass' : pass
  });

  var response = await http.post(urlServer+'/usuario',
      headers: {"Content-Type": "application/json"},
      body: body
  );
  print("${response.statusCode}");
  print("${response.body}");
  return response;
}

// void main() => runApp(MyApp(post: fetchPost()));

// class MyApp extends StatelessWidget {
//   final Future<User> post;

//   MyApp({Key key, this.post}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<User>(
//             future: post,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data.email);
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }

//               // Por defecto, muestra un loading spinner
//               return CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
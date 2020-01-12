import 'package:flutter/material.dart';
import 'package:login_flutter/model/choice.dart';
import 'package:login_flutter/ui/newuser.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login en Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Login(title: 'Login en Flutter'),
    );
  }
}

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  
  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  List<Choice> choices = <Choice>[
    Choice(title: 'Ingresar', icon: Icons.people),
    Choice(title: 'Nuevo', icon: Icons.group_add),
  ];

  Choice _selectedChoice;

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedChoice = choices[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenidos'),
        centerTitle: true,
        //actions: header(),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 45.0),
                TextField(
                  obscureText: false,
                  style: TextStyle(fontSize: 20.0),
                  decoration: textfieldRadius("Email"),
                ),
                SizedBox(height: 25.0),
                TextField(
                  obscureText: true,
                  style: TextStyle(fontSize: 20.0),
                  decoration: textfieldRadius("Password"),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color(0xff01A0C7),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {},
                    child: Text("Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0).copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color(0xff01A0C7),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewUser()));
                    },
                    child: Text("Registrarse",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0).copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  header() {
    return <Widget>[
      IconButton(
        icon: Icon(choices[0].icon),
        onPressed: () {
          _select(choices[0]);
        },
      ),
      IconButton(
        icon: Icon(choices[1].icon),
        onPressed: () {
          _select(choices[1]);
        },
      ),
    ];
  }

  textfieldRadius(text) {
    return InputDecoration(
      contentPadding:
        EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      hintText: text,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0)));
  }



}


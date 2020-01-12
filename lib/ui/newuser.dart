import 'package:flutter/material.dart';

class NewUser extends StatefulWidget {

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
        centerTitle: true,
        //actions: header(),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    'Bienvenido a Login en Flutter',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  child: Text(
                    'Favor llene los siguientes campos:',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(height: 45.0),
                TextField(
                  obscureText: false,
                  style: TextStyle(fontSize: 20.0),
                  decoration: textfieldRegister("Email"),
                ),
                SizedBox(height: 25.0),
                TextField(
                  obscureText: true,
                  style: TextStyle(fontSize: 20.0),
                  decoration: textfieldRegister("Password"),
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
                    child: Text("Guardar",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0).copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  textfieldRegister(text) {
    return InputDecoration(
      contentPadding:
        EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      hintText: text
    );
  }

}


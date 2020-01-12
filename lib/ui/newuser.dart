import 'package:flutter/material.dart';
import 'package:login_flutter/db/api.dart';

class NewUser extends StatefulWidget {

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final _formKey = GlobalKey<FormState>();
  //Controllers
  TextEditingController emailTxt = TextEditingController();
  TextEditingController passTxt = TextEditingController();


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
        child: Form(
          key: _formKey,
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
                  TextFormField(
                    obscureText: false,
                    style: TextStyle(fontSize: 20.0),
                    decoration: textfieldRegister("Email"),
                    controller: emailTxt,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email es Obligatorio';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25.0),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(fontSize: 20.0),
                    decoration: textfieldRegister("Password"),
                    controller: passTxt,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password es Obligatoria';
                      }
                      return null;
                    },
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
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          //await newUser(emailTxt.text, passTxt.text);
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Usuario Creado'),
                                content: const Text('Ya estas registrado, felicidades!!'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
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
      ),
    );
  }

  textfieldRegister(text) {
    return InputDecoration(
      contentPadding:
        EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      hintText: text,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0))
    );
  }

}


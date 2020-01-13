
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_flutter/db/api.dart';
import 'package:login_flutter/model/user.dart';
import 'package:login_flutter/ui/exito.dart';
import 'package:login_flutter/ui/newuser.dart';
import 'package:login_flutter/util/util.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  
  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        title: const Text('Bienvenidos'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Ingrese sus datos por favor',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    TextFormField(
                      obscureText: false,
                      style: TextStyle(fontSize: 20.0),
                      decoration: textfieldRadius("Email"),
                      controller: emailTxt,
                      validator: validateEmail,
                    ),
                    SizedBox(height: 25.0),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(fontSize: 20.0),
                      decoration: textfieldRadius("Password"),
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
                          //Validamos campos
                          if (_formKey.currentState.validate()) {
                            //Verificamos email con la pass
                            var resp = await loginDB(emailTxt.text, passTxt.text);
                            //Decodificamos la respuesta
                            Map<String, dynamic> respuesta = jsonDecode(resp.body);
                            if (respuesta['error'] == false) {
                              //Si no hay error.
                              User usuario = User(email: emailTxt.text, pass: passTxt.text);
                              Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) => Exito(usuario)));
                            } else {
                              showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text(respuesta['mensaje']),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Aceptar'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            limpiarCampos();
                          }
                        },
                        child: Text("Ingresar",
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
                      color: Colors.green,
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewUser()));
                        },
                        child: Text("Crear Nuevo Usuario",
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
        ),
      ),
    );
  }


  void limpiarCampos() {
    emailTxt.text = '';
    passTxt.text = '';
  }

}

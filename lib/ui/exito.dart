import 'package:flutter/material.dart';
import 'package:login_flutter/model/user.dart';

class Exito extends StatefulWidget {
  User user;

  Exito(this.user);

  @override
  _ExitoState createState() => _ExitoState();
}

class _ExitoState extends State<Exito> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido ${widget.user.email}'),
        centerTitle: true,
        //actions: header(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(Icons.done, color: Colors.green,size: 150,),
          Container(height: 50,),
          Text(
            'Bienvenido ${widget.user.email} a Login en Flutter, esperemos que disfrutes esta Demo',
            style: TextStyle(
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

}


import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget{
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage>{

  String _id = "";
  String _passwd = "";

  void validateSave(){

  }

  void showToast(String msg){
    Fluttertoast.showToast(msg: msg,
      backgroundColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM
    );
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('LOGIN'),
      ),
      body: new Container(
        padding: EdgeInsets.all(16),
        child: new Form(
            // key:,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'ID'),
                  validator: (value)=>
                  value.toString().isEmpty ? 'ID Can not be empty':null,
                  onSaved: (value) => _id = value.toString(),
                ),
                new TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(labelText: 'PASSWORD'),
                  validator: (value)=>
                  value.toString().isEmpty ? 'PASSWORD Can not be empty':null,
                  onSaved: (value) => _passwd = value.toString(),
                ),
                new RaisedButton(
                    child: new Text(
                      'LOGIN',
                      style: new TextStyle(fontSize: 20),
                    ),
                    onPressed:(){
                      showToast('BUTTON PRESSED');
                    }
                ),
              ],
            )),
      )
    );
  }
}
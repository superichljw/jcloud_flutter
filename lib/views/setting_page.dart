

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jcloud_flutter/common/util.dart';
import 'package:jcloud_flutter/views/login_page.dart';

class SettingPage extends StatefulWidget{
  @override
  _SettingPage createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage>{
  bool isLoading = false;
  late TextEditingController _urlController;

  String? url = '';
  final storage = FlutterSecureStorage();

  @override
  void initState(){
    super.initState();
    _urlController = TextEditingController();
    _getStoredUrl();
  }

  void _getStoredUrl() async{
    url = await storage.read(key: "url");
    _urlController.text = url.toString();

    setState(() {

    });
  }

  Widget _urlWidget() {
    return TextFormField(
      controller: _urlController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.settings),
        labelText: "CONNECTION URL",
        border: OutlineInputBorder(),
      ),
    );
  }

  void _saveUrl(BuildContext context) async{

    url = _urlController.text;

    await storage.write(key: "url", value: url);

    showToast('저장되었습니다');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }


  Widget _saveButton(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        color: Colors.purple,
        textColor: Colors.white,
        disabledColor: Colors.purple,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        onPressed: () => _saveUrl(context),
        child: Text(
          'url save',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            _urlWidget(),
            SizedBox(
              height: 8,
            ),
            _saveButton(context),
            Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            // _registerButton(),
          ],
        ),
      ),
    );
  }
}
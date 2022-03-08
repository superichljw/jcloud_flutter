import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jcloud_flutter/views/login_page.dart';
import 'package:jcloud_flutter/views/main_page.dart';
import 'package:jcloud_flutter/common/util.dart';
import 'package:jcloud_flutter/views/setting_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () => _checkUser(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Icon(
            Icons.stream,
            size: 80,
            color: Colors.blue,
          )),
    );
  }

  void _checkUser(context) async {
    final storage = new FlutterSecureStorage();
    print('${await storage.readAll()}');
    Map<String, String> allStorage = await storage.readAll();
    String statusUser = '';
    if (allStorage != null) {
      allStorage.forEach((k, v) {
        print('k : $k, v : $v');
        // if (v == STATUS_LOGIN) statusUser = k;
      });
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
    if (statusUser != null && statusUser != '') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainPage(nickName: statusUser)));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jcloud_flutter/common/util.dart';
import 'package:jcloud_flutter/views/setting_page.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  late TextEditingController _userIdCtrl;
  late TextEditingController _userPasswordCtrl;

  @override
  void initState() {
    super.initState();
    _userIdCtrl = TextEditingController();
    _userPasswordCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 30,
        child: FloatingActionButton(
          backgroundColor: Colors.black26,
          child: Icon(Icons.settings),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingPage(),
                fullscreenDialog: true,

              ),
            );
          },
        ),
      ),
      appBar: AppBar(
        title: Text('login Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: SizedBox(),
              ),
              _idWidget(),
              SizedBox(
                height: 8,
              ),
              _passwordWidget(),
              _loginButton(context),
              Expanded(
                flex: 3,
                child: SizedBox(),
              ),
              // _registerButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _idWidget() {
    return TextFormField(
      controller: _userIdCtrl,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        labelText: "Id",
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _passwordWidget() {
    return TextFormField(
      controller: _userPasswordCtrl,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_rounded),
        labelText: "Password",
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _loginButton(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        color: Colors.purple,
        textColor: Colors.white,
        disabledColor: Colors.purple,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        onPressed: () => isLoading ? null : _loginCheck(),
        child: Text(
          isLoading ? 'loggin in.....' : 'login',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Widget _registerButton() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Text('Don\'t have an account ?'),
  //       SizedBox(
  //         width: 20,
  //       ),
  //       InkWell(
  //         onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => RegisterPage())),
  //         child: Text('register'),
  //       ),
  //     ],
  //   );
  // }

  void _loginCheck() async {
    print('_userIdCtrl.text : ${_userIdCtrl.text}');
    print('_userPasswordCtrl.text : ${_userPasswordCtrl.text}');
    final storage = FlutterSecureStorage();
    String? storagePass = await storage.read(key: _userIdCtrl.text);
    if(storagePass != null && storagePass != '' && storagePass == _userPasswordCtrl.text){
      print('storagePass : $storagePass');
      // String? userNickName = await storage.read(key: '${_userIdCtrl.text}_$storagePass');
      // storage.write(key: userNickName, value: STATUS_LOGIN);
      print('로그인 성공');
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainPage(nickName: userNickName)));
    } else {
      print('로그인 실패');
      showToast('아이디가 존재하지 않거나 비밀번호가 맞지않습니다.');
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/home_page.dart';
import 'package:flutter_login/signup_screen.dart';

class login_screen extends StatefulWidget{
@override
_loginscreenState createState() => _loginscreenState();
}
class _loginscreenState extends State<login_screen>{

  bool isRememberMe = false;

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight:  FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xff5ac18e),
              ),
              hintText: 'Email',
              hintStyle: TextStyle(
                  color: Colors.black38
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight:  FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff5ac18e),
              ),
              hintText: 'Password',
              hintStyle: TextStyle(
                  color: Colors.black38
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTombolnoAccount(){
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => signup_screen())
          );
        },
        child: Text(
          'Belum punya akun?',
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }

  Widget buildRemember(){
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value){
                setState(() {
                  isRememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Remember me',
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          )
          )],
      ),
    );
  }



  Widget buildBtnLogin(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage())
          );
        },
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

@override
  Widget build(BuildContext context) {
   return Scaffold(
     body: AnnotatedRegion<SystemUiOverlayStyle>(
       value: SystemUiOverlayStyle.light,
       child: GestureDetector(
         child: Stack(
           children: <Widget>[
            Container(
              height: double.infinity,
              width:  double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x66c1d0f7),
                    Color(0x99c1d0f7),
                    Color(0xccc1d0f7),
                    Color(0xffc1d0f7),
                  ],
                )
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 120
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Login Here',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Image.asset('images/img1.png'),
                    SizedBox(height: 50),
                    buildEmail(),
                    SizedBox(height: 15),
                    buildPassword(),
                    buildTombolnoAccount(),
                    buildRemember(),
                    buildBtnLogin(),
                  ],
                ),
              ),
            )
           ],
         ),
       ),
     ),
   );
  }
}
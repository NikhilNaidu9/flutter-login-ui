import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(primarySwatch: Colors.teal),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAimationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 5));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() {
      this.setState(() {});
    });
    _iconAimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/StringsWayTech.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.orange,
                      inputDecorationTheme: new InputDecorationTheme(
                          hintStyle: new TextStyle(
                            color: Colors.orange,
                          ),
                          labelStyle: new TextStyle(
                              color: Colors.orange, fontSize: 20.0))),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 40.0)),
                        new MaterialButton(
                          height: 40.0,
                          minWidth: 100.0,
                          onPressed: () => {},
                          color: Colors.orange,
                          textColor: Colors.white,
                          child: new Text("Login"),
                          splashColor: Colors.yellowAccent,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

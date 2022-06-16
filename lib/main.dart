import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.

          ),
      home: const MyHomePage(title: 'Clikker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _bossDamage = 230;
  List<String> _pers1 = [
    'https://static.wikia.nocookie.net/among-us/images/6/6a/Rednew.png/revision/latest/scale-to-width-down/78?cb=20210616054139&path-prefix=ru',
    'https://static.wikia.nocookie.net/among-us/images/5/5e/Bluenew.png/revision/latest/scale-to-width-down/78?cb=20210616054220&path-prefix=ru'
  ];
  List<String> _pers2 = [
    'https://static.wikia.nocookie.net/among-us/images/5/5e/Bluenew.png/revision/latest/scale-to-width-down/78?cb=20210616054220&path-prefix=ru',
    'https://static.wikia.nocookie.net/among-us/images/f/f2/Greennew.png/revision/latest/scale-to-width-down/78?cb=20210616054252&path-prefix=ru',
    'https://static.wikia.nocookie.net/among-us/images/6/64/Orangenew.png/revision/latest/scale-to-width-down/78?cb=20210616054539&path-prefix=ru',
    'https://wonder-day.com/wp-content/uploads/2020/10/wonder-day-among-us-13.png'
  ];
  List<String> _knif = [
    'https://www.pngplay.com/wp-content/uploads/9/Wi-Fi-Icon-Transparent-Free-PNG.png',
    'https://wonder-day.com/wp-content/uploads/2020/10/wonder-day-among-us-png-38.png'
  ];
  List<String> _fon = [
    'https://www.pngplay.com/wp-content/uploads/9/Wi-Fi-Icon-Transparent-Free-PNG.png',
    'https://virtualbg-brandstudio.netdna-ssl.com/wp-content/uploads/2020/10/imposter-background.jpg'
  ];

  var _b = 0;
  var _a = 0;
  void damage(TapDownDetails details) {
    setState(() {
      _bossDamage = _bossDamage - 30;
      if (_a < 3) {
        _a++;
      }
      if ((_bossDamage - 30) < 0) {
        _b = 1;
        _bossDamage = 0;
      }
      if (_bossDamage == 0) {
        _a = 3;
      } else if (_a == 3 && _bossDamage != 0) {
        _a = 0;
      }
    });
  }

  void paint() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapDown: (TapDownDetails details) => damage(details),
        child: Stack(children: <Widget>[
          Container(
            child: Image.network('${_fon[_b]}'),
            height: 10000,
            width: 10000,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    'https://modmcpe.net/uploads/posts/2020-10/1604161342_minecraft-among-us_3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Image.network('${_pers1[_b]}'),
            height: 800,
            width: 200,
            margin: EdgeInsets.fromLTRB(450, 400, 10, 10),
          ),
          Container(
            child: Image.network('${_knif[_b]}'),
            height: 50,
            width: 200,
            margin: EdgeInsets.fromLTRB(460, 530, 10, 10),
          ),
          Container(
            child: Image.network('${_pers2[_a]}'),
            height: 100,
            width: 300,
            margin: EdgeInsets.fromLTRB(500, 475, 10, 10),
          ),
          Container(
            child: Text("Value: $_bossDamage",
                style: TextStyle(color: Colors.white, fontSize: 45)),
            alignment: Alignment.topCenter,
          ),
        ]),
      ),
    );
  }
}

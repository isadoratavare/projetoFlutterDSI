import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      //MyHomePage(title: 'Contador'),
    );
  }
}

class Home extends StatelessWidget {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Aperte o botão',
              style: TextStyle(fontSize: 30),
            ),
            Column(children: [
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: RaisedButton(
                      child: Text(
                        "Clique",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: incrementCounter,
                      color: Colors.blueGrey,
                      textColor: Colors.white))
            ]),
            Column(children: [
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                      child: Text(
                        "Resultado",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage(counter)),
                        );
                      },
                      color: Colors.blueGrey,
                      textColor: Colors.white))
            ])
          ],
        ),
      ),
    );
  }

  void incrementCounter() {
    counter++;
  }
}

class MyHomePage extends StatefulWidget {
  final int counter;
  const MyHomePage(int counter) : counter = counter;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get result => widget.counter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Você apertou ',
            ),
            Text(
              '$result vezes',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}

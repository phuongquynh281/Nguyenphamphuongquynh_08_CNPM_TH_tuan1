import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Homework'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _backgroundColor = Colors.white; // Màu nền mặc định là trắng

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeBackgroundColor() {
    setState(() {
      List<Color> colors = [
        Colors.red,
        Colors.green,
        Colors.blue,
        Colors.yellow,
        Colors.purple,
        Colors.orange,
      ];
      _backgroundColor = colors[DateTime.now().millisecond % colors.length];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[700],
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: () {
                _incrementCounter();
                _changeBackgroundColor();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue[400],
                onPrimary: Colors.white,
              ),
              child: const Text(
                'Click me to change background color',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: _backgroundColor,
    );
  }
}

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
      home: const MyHomePage(title: 'Trang chu'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white), // Change the title color here
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 40), // Khoảng cách giữa const Text và Row
          const Text(
            'Nguyễn Phạm Phương Quỳnh, 08_DH_CNPM',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40), // Khoảng cách giữa Row và SizedBox
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Khối màu 1
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
              // Khối màu 2
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              // Khối màu 3
              Container(
                width: 100,
                height: 100,
                color: Colors.orange,
              ),
            ],
          ),
          const SizedBox(height: 100), // Khoảng cách giữa SizedBox và Image
          SizedBox(
            width: 650,
            height: 200,
            child: Image.network(
              'https://deiniresendiz.com/wp-content/uploads/2020/02/flutter.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 40), // Khoảng cách giữa Image và ElevatedButton
          Container(
            margin: const EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Bấm vào đây !',
                style: TextStyle(fontSize: 20.0),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue[400],
                onPrimary: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20), // Khoảng cách giữa ElevatedButton và đáy Column
        ],
      ),

    );
  }
}

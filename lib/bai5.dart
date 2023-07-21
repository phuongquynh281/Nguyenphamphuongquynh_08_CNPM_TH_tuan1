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
      home: const MyHomePage(title: 'Kiem tra so nguyen to'),
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
  int _number = 0;
  String _result = '';

  bool _isPrime(int number) {
    if (number <= 1) return false;
    if (number <= 3) return true;
    if (number % 2 == 0 || number % 3 == 0) return false;

    int i = 5;
    while (i * i <= number) {
      if (number % i == 0 || number % (i + 2) == 0) return false;
      i += 6;
    }
    return true;
  }

  void _checkPrime() {
    setState(() {
      _result = _isPrime(_number) ? 'Đây là số nguyên tố.' : 'Đây không phải là số nguyên tố.';
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
          BlueBorderedTextField(
            onChanged: (value) {
              setState(() {
                _number = int.tryParse(value) ?? 0;
              });
            },
          ), // Use the custom BlueBorderedTextField here
          const SizedBox(height: 40), // Khoảng cách giữa Image và ElevatedButton
          Container(
            margin: const EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: _checkPrime,
              child: const Text(
                'Kiem tra',
                style: TextStyle(fontSize: 20.0),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue[400],
                onPrimary: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20), // Khoảng cách giữa ElevatedButton và đáy Column
          Text(
            _result,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class BlueBorderedTextField extends StatelessWidget {
  const BlueBorderedTextField({required this.onChanged});

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      onChanged: onChanged,
    );
  }
}

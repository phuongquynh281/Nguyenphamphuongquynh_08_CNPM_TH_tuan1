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
      home: const MyHomePage(title: 'Calculator'),
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
  TextEditingController numberAController = TextEditingController();
  TextEditingController numberBController = TextEditingController();
  double result = 0;

  void calculateResult(String operator) {
    double numberA = double.tryParse(numberAController.text) ?? 0;
    double numberB = double.tryParse(numberBController.text) ?? 0;

    setState(() {
      switch (operator) {
        case '+':
          result = numberA + numberB;
          break;
        case '-':
          result = numberA - numberB;
          break;
        case 'x':
          result = numberA * numberB;
          break;
        case ':':
          if (numberB != 0) {
            result = numberA / numberB;
          } else {
            result = double.infinity;
          }
          break;
        default:
          result = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 80),
          SizedBox(
            width: 250,
            height: 150,
            child: Image.network(
              'https://media.wired.com/photos/5c83066025da7204699767c7/16:9/w_2400,h_1350,c_limit/calculator-1470.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: TextFormField(
                  controller: numberAController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nhập số A',
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: TextFormField(
                  controller: numberBController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nhập số B',
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(
                  'Kết quả $result',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      calculateResult('+');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      backgroundColor: Colors.blue[500],
                      minimumSize: Size(90, 30),
                    ),
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      calculateResult('-');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      backgroundColor: Colors.red[400],
                      minimumSize: Size(90, 30),
                    ),
                    child: Text(
                      '-',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      calculateResult('x');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      backgroundColor: Colors.green[300],
                      minimumSize: Size(90, 30),
                    ),
                    child: Text(
                      'x',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      calculateResult(':');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      backgroundColor: Colors.orange,
                      minimumSize: Size(90, 30),
                    ),
                    child: Text(
                      ':',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}

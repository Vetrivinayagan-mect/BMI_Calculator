import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 170.0; // Default height in cm
  double _weight = 70.0; // Default weight in kg
  int _bmi = 0;
  String _condition = "Select Data";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                height: size.height * 0.4,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.teal],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "BMI",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Calculator",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "$_bmi",
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: "Condition: ",
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: _condition,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    "Choose Data",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Height: ${_height.toStringAsFixed(1)} cm",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Slider(
                    value: _height,
                    min: 50,
                    max: 250,
                    divisions: 200,
                    label: "${_height.toStringAsFixed(1)} cm",
                    onChanged: (value) {
                      setState(() {
                        _height = value;
                      });
                    },
                    activeColor: Colors.green,
                    inactiveColor: Colors.green[100],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Weight: ${_weight.toStringAsFixed(1)} kg",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Slider(
                    value: _weight,
                    min: 10,
                    max: 200,
                    divisions: 190,
                    label: "${_weight.toStringAsFixed(1)} kg",
                    onChanged: (value) {
                      setState(() {
                        _weight = value;
                      });
                    },
                    activeColor: Colors.green,
                    inactiveColor: Colors.green[100],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      setState(() {
                        _bmi = (_weight / ((_height / 100) * (_height / 100)))
                            .round()
                            .toInt();
                        if (_bmi >= 18.5 && _bmi <= 25) {
                          _condition = "Normal";
                        } else if (_bmi > 25 && _bmi <= 30) {
                          _condition = "Overweight";
                        } else if (_bmi > 30) {
                          _condition = "Obesity";
                        } else {
                          _condition = "Underweight";
                        }
                      });
                    },
                    child: const Text(
                      "Calculate",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

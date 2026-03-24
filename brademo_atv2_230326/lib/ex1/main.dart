import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.all(10.0),
            width: 120,
            height: 120,
            color: Colors.amber.shade600,
            child: Row(
              children: [
                Text(
                  'Fala Professor!',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                Icon(Icons.air, color: Colors.pink.shade600, size: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

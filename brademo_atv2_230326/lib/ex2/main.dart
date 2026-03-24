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
        bottomNavigationBar: BottomAppBar(
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: [
                  Icon(Icons.call, color: Colors.pink, size: 30.0),
                  Text(
                    'Call',
                    style: TextStyle(fontSize: 15, color: Colors.pink),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.alt_route_sharp, color: Colors.green, size: 30.0),
                  Text(
                    'Route',
                    style: TextStyle(fontSize: 15, color: Colors.green),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.ios_share, color: Colors.blue, size: 30.0),
                  Text(
                    'Share',
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

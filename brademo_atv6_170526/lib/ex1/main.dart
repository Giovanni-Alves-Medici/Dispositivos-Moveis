import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box box;
  bool isRelax = true;

  @override
  void initState() {
    super.initState();
    box = Hive.box('settings');
    isRelax = box.get('isRelax', defaultValue: true) as bool;
  }

  void toggleMode() {
    setState(() {
      isRelax = !isRelax;
      box.put('isRelax', isRelax);
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = isRelax ? Colors.blue : Colors.green;
    final text = isRelax ? 'Modo Relax' : 'Modo Focado';

    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: ElevatedButton(
          onPressed: toggleMode,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: color,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

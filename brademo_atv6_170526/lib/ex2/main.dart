import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Contador extends ChangeNotifier {
  int _valor = 0;
  int get valor => _valor;

  void incrementar() {
    _valor++;
    notifyListeners();
  }

  void decrementar() {
    _valor--;
    notifyListeners();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Contador(),
      child: const MaterialApp(home: CounterScreen()),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercício ex2')),
      body: Center(
        child: Consumer<Contador>(
          builder: (context, contador, _) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${contador.valor}',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: contador.incrementar,
                    child: const Text('Incrementar'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: contador.decrementar,
                    child: const Text('Decrementar'),
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

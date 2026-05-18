import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brademo_atv6_040526/ex3/tarefa_provider.dart';

class TarefasApp extends StatefulWidget {
  const TarefasApp({super.key});

  @override
  State<TarefasApp> createState() => _TarefasAppState();
}

class _TarefasAppState extends State<TarefasApp> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercício ex3 - Lista de Tarefas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Consumer<TarefaProvider>(
              builder: (context, provider, _) => Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Nova tarefa',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (value) {
                        provider.addTarefa(value);
                        _controller.clear();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      provider.addTarefa(_controller.text);
                      _controller.clear();
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Consumer<TarefaProvider>(
                builder: (context, provider, _) {
                  final tarefas = provider.tarefas;
                  if (tarefas.isEmpty) {
                    return const Center(child: Text('Nenhuma tarefa'));
                  }
                  return ListView.builder(
                    itemCount: tarefas.length,
                    itemBuilder: (context, index) {
                      final tarefa = tarefas[index];
                      return Dismissible(
                        key: ValueKey(tarefa + index.toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) => provider.removeTarefaAt(index),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: ListTile(
                          title: Text(tarefa),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => provider.removeTarefaAt(index),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

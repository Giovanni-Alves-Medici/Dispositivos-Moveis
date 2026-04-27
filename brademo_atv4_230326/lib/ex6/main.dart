import 'package:flutter/material.dart';

void main() {
  runApp(const Ex6App());
}

class Task {
  final String title;
  final String timestamp;
  bool isCompleted;

  Task({
    required this.title,
    required this.timestamp,
    this.isCompleted = false,
  });
}

class Ex6App extends StatelessWidget {
  const Ex6App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 6 - Task Notes App',
      home: Ex6Page(),
    );
  }
}

class Ex6Page extends StatefulWidget {
  const Ex6Page({super.key});

  @override
  State<Ex6Page> createState() => _Ex6PageState();
}

class _Ex6PageState extends State<Ex6Page> {
  late List<Task> tasks;

  @override
  void initState() {
    super.initState();
    tasks = [
      Task(title: 'Complete Flutter Project', timestamp: '2026-04-15 09:30'),
      Task(title: 'Review Code Changes', timestamp: '2026-04-15 10:45'),
      Task(title: 'Update Documentation', timestamp: '2026-04-15 11:20'),
      Task(title: 'Test New Features', timestamp: '2026-04-15 14:00'),
      Task(title: 'Deploy to Production', timestamp: '2026-04-15 16:30'),
    ];
  }

  int get uncompletedTasksCount =>
      tasks.where((task) => !task.isCompleted).length;

  int get completedTasksCount => tasks.where((task) => task.isCompleted).length;

  void _showTaskDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Task Notes App'),
          content: const Text(
            'Você está no App de Notas de Tarefas',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _viewCompletedTasks() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final completedTasks = tasks.where((task) => task.isCompleted).toList();
        return AlertDialog(
          title: const Text('Completed Tasks'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(completedTasks[index].title),
                  subtitle: Text(completedTasks[index].timestamp),
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _toggleTask(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Notes'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // View Completed Tasks Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _viewCompletedTasks,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'View Completed Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Uncompleted Tasks Count
            Text(
              'You Have $uncompletedTasksCount uncompleted Tasks',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),

            // Tasks List
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: task.isCompleted,
                            onChanged: (value) => _toggleTask(index),
                            activeColor: Colors.blue,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task.title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    decoration: task.isCompleted
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    color: task.isCompleted
                                        ? Colors.grey
                                        : Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  task.timestamp,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showTaskDialog,
        tooltip: 'Show Dialog',
        child: const Icon(Icons.add),
      ),
    );
  }
}

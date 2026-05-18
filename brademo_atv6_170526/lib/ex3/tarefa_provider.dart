import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TarefaProvider extends ChangeNotifier {
  final Box box;
  List<String> _tarefas = [];

  List<String> get tarefas => _tarefas;

  TarefaProvider(this.box) {
    final stored = box.get('tarefas', defaultValue: <String>[]);
    _tarefas = List<String>.from(stored);
  }

  void addTarefa(String tarefa) {
    if (tarefa.trim().isEmpty) return;
    _tarefas.add(tarefa);
    box.put('tarefas', _tarefas);
    notifyListeners();
  }

  void removeTarefaAt(int index) {
    if (index < 0 || index >= _tarefas.length) return;
    _tarefas.removeAt(index);
    box.put('tarefas', _tarefas);
    notifyListeners();
  }

  void removeTarefa(String tarefa) {
    _tarefas.remove(tarefa);
    box.put('tarefas', _tarefas);
    notifyListeners();
  }
}

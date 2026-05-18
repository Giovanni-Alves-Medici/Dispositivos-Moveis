import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:brademo_atv6_040526/ex3/tarefa_provider.dart';
import 'package:brademo_atv6_040526/ex3/tarefas_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('tarefas');
  final box = Hive.box('tarefas');

  runApp(
    ChangeNotifierProvider(
      create: (_) => TarefaProvider(box),
      child: const MaterialApp(home: TarefasApp()),
    ),
  );
}

import 'dart:io';
import 'package:brademo_atv1_ex1/brademo_atv1_ex5.dart';

void main() {
  final houses = <House>[];

  for (var i = 0; i < 3; i++) {
    stdout.write('Digite o id da casa #${i + 1}: ');
    final idInput = stdin.readLineSync();
    stdout.write('Digite o nome da casa #${i + 1}: ');
    final nameInput = stdin.readLineSync();
    stdout.write('Digite o preço da casa #${i + 1}: ');
    final priceInput = stdin.readLineSync();

    if (idInput == null || nameInput == null || priceInput == null) {
      print('Entrada inválida, pulando esta casa.');
      continue;
    }

    final id = int.parse(idInput);
    final name = nameInput;
    final price = double.parse(priceInput);

    // cria o objeto e adiciona à lista
    houses.add(House(id, name, price));
  }

  // usando notação cascade para ajustar nomes
  for (var house in houses) {
    house..name = '${house.name} (Cadastrada)';
  }

  // imprimir detalhes
  print('\nCasas cadastradas:');
  for (var house in houses) {
    print(house);
  }
}

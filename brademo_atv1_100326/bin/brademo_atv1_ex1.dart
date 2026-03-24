import 'package:brademo_atv1_ex1/brademo_atv1_ex1.dart';

void main(List<String> arguments) {
  var imp3D =  Equipamentos('Impressora 3D', 'Lab.Protótipos', 12345);
  print('Equipamento: ${imp3D.nome}(${imp3D.nome is String}), Local: ${imp3D.local}(${imp3D.local is String}), Patrimônio: ${imp3D.numPatrimonio}(${imp3D.numPatrimonio is String})');

  imp3D.numPatrimonio = '12345-A';
  print('Equipamento: ${imp3D.nome}(${imp3D.nome is String}), Local: ${imp3D.local}(${imp3D.local is String}), Patrimônio: ${imp3D.numPatrimonio}(${imp3D.numPatrimonio is String})');

}

/* BRADEMO - Desenvolvimento para Dispositivos Móveis
  * Professor: Luis Gustavo Veras *
  * Aluno: Matheus Galasso - BP3053598
  * Atividade 1 - Exercício 1
  * Data: 09/03/2026 

    O atributo numPatrimonio foi declarado como dynamic, para poder permitir a alteração do tipo de dado.
    Ao contrário de String, o tipo dynamic não é verificado em tempo de compilação, o que permite 
  atribuir valores de diferentes tipos sem gerar erros.
*/

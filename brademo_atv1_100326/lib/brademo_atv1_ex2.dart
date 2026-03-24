void cadastrarFuncionario({required String nome, String? cargo}) {
  if (cargo != null) {
    print('Bem-vindo, $nome! Você foi cadastrado como $cargo.');
  } else {
    print('Bem-vindo, $nome! Você foi cadastrado na empresa.');
  }
}


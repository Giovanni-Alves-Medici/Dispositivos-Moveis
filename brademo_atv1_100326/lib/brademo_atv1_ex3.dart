class Laptop {
  int id;
  String nome;
  int ram; 
  double clockCpu;

  Laptop({
    required this.id,
    required this.nome,
    required this.ram,
    required this.clockCpu,
  });

  @override
  String toString() =>
      'Laptop{id: $id, nome: $nome, ram: ${ram}GB, clockCpu: ${clockCpu}GHz}';
}

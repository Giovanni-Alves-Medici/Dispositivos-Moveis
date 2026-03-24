class Laptop {
  final int id;
  final String nome;
  final int ram; 
  final double clockCpu; 

  Laptop(this.id, this.nome, this.ram, this.clockCpu);

  Laptop.navegador({int id = 1})
      : nome = 'Navegador',
        ram = 4,
        clockCpu = 1.5,
        id = id;

  Laptop.escritorio({int id = 2})
      : nome = 'Escritório',
        ram = 8,
        clockCpu = 2.5,
        id = id;

  Laptop.programacao({int id = 3})
      : nome = 'Programador',
        ram = 16,
        clockCpu = 3.5,
        id = id;

  @override
  String toString() {
    return 'Laptop{id: $id, nome: $nome, ram: ${ram}GB, clockCpu: ${clockCpu}GHz}';
  }
}


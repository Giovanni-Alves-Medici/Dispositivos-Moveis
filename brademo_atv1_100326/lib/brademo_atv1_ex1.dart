class Equipamentos {
  var _nome;
  String _local;
  dynamic _numPatrimonio;

  Equipamentos(this._nome, this._local, this._numPatrimonio);

  Equipamentos.optional({var nome, String local = '', dynamic numPatrimonio})
      : _nome = nome,
        _local = local,
        _numPatrimonio = numPatrimonio;

  get nome => this._nome;
  String get local => this._local;
  dynamic get numPatrimonio => this._numPatrimonio;


  set nome(var valor) => this._nome = valor;
  set local(String valor) => this._local = valor;
  set numPatrimonio(dynamic valor) => this._numPatrimonio = valor;
}


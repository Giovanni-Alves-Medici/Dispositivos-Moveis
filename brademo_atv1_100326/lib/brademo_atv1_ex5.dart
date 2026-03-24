
class House {
  int id;
  String name;
  double price;

  House(this.id, this.name, this.price);

  @override
  String toString() => 'House{id: $id, name: $name, price: \$${price.toStringAsFixed(2)}}';
}

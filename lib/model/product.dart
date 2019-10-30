class Product{
  String _id;
  double _price;
  String _name;

  Product(this._id, this._name, this._price);

  String get id => _id;

  double get price => _price;

  String get name => _name;

}
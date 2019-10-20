class Product{
  String _id;
  double _price;
  String _name;
  double _averagePrice;
  List _prices;

  Product(this._id, this._name, this._prices){
    this._price = _prices.last();
  }

  addPrice(double price){
    _prices.add(price);
    this._price = price;
  }

  String get id => _id;

  double get price => _price;

  String get name => _name;

  double get averagePrice => _averagePrice;
}
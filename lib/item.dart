
class Item {
  final String id;
  String name;
  String code;
  double price;
  int stockCount;

  Item(this.id, this.name, this.code, this.price, this.stockCount);

  factory Item.fromJson(Map<String, dynamic> item) =>
    new Item(item['id'], item['name'], item['code'], _toPrice(item['price']), 
             item['stockCount']);
  
  String get displayPrice => "\$${price.toStringAsFixed(2)}";
}

// int _toInt(val) => val is int ? val : int.parse(val);
double _toPrice(val) => val.toDouble() * 0.01;

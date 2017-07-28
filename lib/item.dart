
class Item {
  final String id;
  String name;
  String code;
  int price;
  int stockCount;

  Item(this.id, this.name, this.code, this.price, this.stockCount);


  factory Item.fromJson(Map<String, dynamic> item) =>
    new Item(item['id'], item['name'], item['code'], item['price'], item['stockCount']);
}

// int _toInt(id) => id is int ? id : int.parse(id);

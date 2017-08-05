import 'dart:async';

import 'package:angular2/angular2.dart';

import 'cart_service.dart';
import 'inventory_service.dart';
import 'item_display_component.dart';
import 'item.dart';

@Component(
  selector: 'search',
  templateUrl: 'search_component.html',
  directives: const [CORE_DIRECTIVES, ItemDisplayComponent],
  providers: const [InventoryService],
)
class SearchComponent {
  List<Item> results = [];

  final InventoryService _inventoryService;
  final CartService _cartService;
  SearchComponent(this._inventoryService, this._cartService);

  Future<Null> search(String query) async {
    if (query.isNotEmpty) 
      results = await _inventoryService.searchItems(query);
  }
  
  void addToCart(Item item) {
    _cartService.addToCart(item);
  }

}

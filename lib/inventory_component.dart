import 'dart:async';

import 'item.dart';
import 'cart_service.dart';
import 'inventory_service.dart';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';


@Component(
  selector: 'inventory',
  templateUrl: 'inventory_component.html',
  directives: const [CORE_DIRECTIVES],
  pipes: const [COMMON_PIPES],
  providers: const [InventoryService]
)
class InventoryComponent implements OnInit {
  String type;
  List<Item> items;

  final RouteParams _routeParams;
  final CartService _cartService;
  final InventoryService _inventoryService;

  InventoryComponent(this._routeParams, this._cartService, this._inventoryService);

  void ngOnInit() {
    type = _routeParams.get('type');
    getItems(type);
  }

  // Get items for given type
  Future<Null> getItems(String type) async {

    try {
      items = await _inventoryService.getItems(type);    
    } catch (e) {
      print(e.toString());
    }
  }

  void addToCart(Item item) {
    _cartService.addToCart(item);
  }

}

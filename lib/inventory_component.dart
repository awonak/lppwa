import 'item.dart';
import 'cart_service.dart';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';


@Component(
  selector: 'inventory',
  templateUrl: 'inventory_component.html',
  directives: const [CORE_DIRECTIVES],
  pipes: const [COMMON_PIPES],
)
class InventoryComponent implements OnInit {
  String name = 'default';
  List<Item> items;

  final RouteParams _routeParams;
  final CartService _cartService;

  InventoryComponent(this._routeParams, this._cartService);

  void ngOnInit() {
    var type = _routeParams.get('type');
    getItems(type);
  }

  // Get items for given type
  void getItems(String type) {
    switch (type) {
      case 'beer':
        name = 'Beer';
        items = [
          new Item('QFR3W9BRX0VG4', 'Victory Storm King', 630279688069, 11.99, 3),
          new Item('SNSBF3728BGCA', 'Pipeworks Guavanatrix', 820103909853, 10.99, 5),
          new Item('112QMJYDF9D5J', 'The Bruery Smoking Wood', 705105536453, 21.99, 3),
        ];
        break;
      case 'wine':
        name = 'Wine';        
        items = [
          new Item('QFR3W9BRX0VG4', 'Rosenblum bubbly musc', 630279688069, 19.99, 3),
          new Item('SNSBF3728BGCA', 'Cliff Lede Poetry Cabernet \'08', 820103909853, 184.99, 5),
          new Item('112QMJYDF9D5J', 'Ghost Block Cabernet Sauv \'08', 705105536453, 119.99, 0),
        ];
        break;
      case 'spirits':
        name = 'Spirits';        
        items = [
          new Item('QFR3W9BRX0VG4', 'Leopold Brothers Absinthe 375m', 630279688069, 43.99, 3),
          new Item('SNSBF3728BGCA', 'Bulleit Bourbon10yr', 820103909853, 53.99, 5),
          new Item('112QMJYDF9D5J', 'Noah\'s Mill Bourbon', 705105536453, 59.99, 0),
        ];
        break;
      default:
        throw new ArgumentError('Not a valid category');
    }
  }

  void addToCart(Item item) {
    print('add to cart...');
    _cartService.addToCart(item);
  }

}

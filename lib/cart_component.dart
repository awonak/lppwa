import 'item.dart';
import 'cart_service.dart';

import 'package:angular2/angular2.dart';

@Component(
  selector: 'cart',
  templateUrl: 'cart_component.html',
  directives: const [CORE_DIRECTIVES],
  pipes: const [COMMON_PIPES],
)
class CartComponent implements OnInit {
  Set<Item> cart;
  double cart_total = 0.0;

  final CartService _cartService;
  CartComponent(this._cartService);

  void ngOnInit() {
    cart = _cartService.getCart();
    cart.forEach((e) => cart_total += e.price);
  }

  // Just empty the cart for now
  void checkout() {
    cart.clear();
    cart_total = 0.0;
  }
}

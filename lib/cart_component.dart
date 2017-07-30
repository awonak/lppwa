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
  List<Item> cart;

  final CartService _cartService;
  CartComponent(this._cartService);

  void ngOnInit() {
    cart = _cartService.getCart();
  }

  String getCartTotal() {
    double cart_total = 0.0;
    cart.forEach((e) => cart_total += e.price);
    return "\$${cart_total.toStringAsFixed(2)}";
  }

  void removeFromCart(Item item) {
    print('remove from cart...');
    _cartService.removeFromCart(item);
  }

  // Just empty the cart for now
  void checkout() {
    cart.clear();
  }
}

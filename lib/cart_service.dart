import 'item.dart';
import 'package:angular2/angular2.dart';

@Injectable()
class CartService {
  
  final cart = new Set<Item>();

  void addToCart(Item item) {
    cart.add(item);
    print('added $item.name: $cart');
  }

  Set<Item> getCart() {
    print('get cart: $cart');
    return cart;
  }

}

import 'item.dart';
import 'package:angular2/angular2.dart';

@Injectable()
class CartService {
  
  final cart = new List<Item>();

  void addToCart(Item item) {
    cart.add(item);
    print('added ${item.name}: $cart');
  }

  void removeFromCart(Item item) {
    cart.remove(item);
    print('added ${item.name}: $cart');
  }

  List<Item> getCart() {
    print('get cart: $cart');
    return cart;
  }

  int getCartSize() {
    return cart.length;
  }

}

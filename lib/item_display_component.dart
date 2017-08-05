import 'dart:async';

import 'package:angular2/angular2.dart';

import 'item.dart';

@Component(
  selector: 'item-display',
  templateUrl: 'item_display_component.html',
  directives: const [CORE_DIRECTIVES],
)
class ItemDisplayComponent {
  @Input()
  List<Item> items;
  
  final _addRequest = new StreamController<Item>();
  @Output()
  Stream<Item> get addRequest => _addRequest.stream;

  void addToCart(Item item) {
    _addRequest.add(item);
  }
}

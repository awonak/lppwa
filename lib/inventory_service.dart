import 'dart:async';
import 'dart:convert';

import 'package:angular2/angular2.dart';
import 'package:http/http.dart';
import 'package:http/browser_client.dart';

import 'item.dart';

const String BEER = 'beer';
const String WINE = 'wine';
const String SPIRITS = 'spirits';

// TODO(awonak): make this configurable
const String BASE_URL = 'http://localhost:9000/api/v1';

@Injectable()
class InventoryService {
  final BrowserClient _http;
  InventoryService(this._http);

  // Get items for given type
  Future<List<Item>> getItems(String type) async {
    var _itemsUrl = '/inventory/category/$type';

    try {
      print(_itemsUrl);
      final response = await _http.get(BASE_URL+_itemsUrl);
      final items = _extractData(response)
          .map((value) => new Item.fromJson(value))
          .toList();
      return items;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => JSON.decode(resp.body)['elements'];

  Exception _handleError(dynamic e) {
    print(e);
    return new Exception('Server error; cause: $e');
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:angular2/angular2.dart';
import 'package:http/http.dart';
import 'package:http/browser_client.dart';

import 'item.dart';

const String BEER = 'beer';
const String WINE = 'wine';
const String SPIRITS = 'spirits';

const String BASE_URL = '/api/v1';

@Injectable()
class InventoryService {
  final BrowserClient _http;
  InventoryService(this._http);

  // Search for given phrase
  Future<List<Item>> searchItems(String query) async {
    List<Item> items;
    Response response;

    String url = BASE_URL + '/inventory/search?q=$query';
    String uri = Uri.encodeFull(url);
    try {
      print(uri);
      response = await _http.get(uri);
      items = _extractData(response)
          .map((value) => new Item.fromJson(value))
          .toList();
      return items;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Get items for given type
  Future<List<Item>> getItems(String type) async {
    List<Item> items;
    Response response;

    String _itemsUrl = BASE_URL + '/inventory/category/$type';

    try {
      print(_itemsUrl);
      response = await _http.get(_itemsUrl);
      items = _extractData(response)
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

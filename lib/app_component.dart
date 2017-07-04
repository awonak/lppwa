// Copyright (c) 2017. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular_components/angular_components.dart';

import 'cart_component.dart';
import 'cart_service.dart';
import 'home_component.dart';
import 'inventory_component.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, materialDirectives],
  providers: const [ROUTER_PROVIDERS, CartService, materialProviders],
)
@RouteConfig(const [
  const Route(path: '/', name: 'Home', component: HomeComponent, useAsDefault: true),
  const Route(path: '/inventory/:type', name: 'Inventory', component: InventoryComponent),
  const Route(path: '/cart', name: 'Cart', component: CartComponent),
])
class AppComponent {
  var title = "Liquor Park";

  final CartService _cartService;

  AppComponent(this._cartService);

  getCartSize() => _cartService.getCartSize();

}

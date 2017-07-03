// Copyright (c) 2017. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'cart_component.dart';
import 'cart_service.dart';
import 'home_component.dart';
import 'inventory_component.dart';
import 'item.dart';


@Component(
  selector: 'my-app',
  template: '''
    <h1>{{title}}</h1>
    <nav>
      <a [routerLink]="['Home']">Home</a>
      <a [routerLink]="['Inventory', {'type': 'beer'}]">Beer</a>
      <a [routerLink]="['Inventory', {'type': 'wine'}]">Wine</a>
      <a [routerLink]="['Inventory', {'type': 'spirits'}]">Spirits</a>
      <a [routerLink]="['Cart']">Cart</a>
    </nav>
    <router-outlet></router-outlet>''',
  directives: const [ROUTER_DIRECTIVES],
  providers: const [ROUTER_PROVIDERS, CartService],
)
@RouteConfig(const [
  const Route(path: '/', name: 'Home', component: HomeComponent, useAsDefault: true),
  const Route(path: '/inventory/:type', name: 'Inventory', component: InventoryComponent),
  const Route(path: '/cart', name: 'Cart', component: CartComponent),
])
class AppComponent {
  final title = 'Liquor Park';

  final savedNames = new Set<Item>();

}

// Copyright (c) 2017. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/platform/browser.dart';
import 'package:angular_app/app_component.dart';
import 'package:pwa/client.dart' as pwa;


void main() {
  // register PWA ServiceWorker for offline caching.
  new pwa.Client();
  
  bootstrap(AppComponent);
}
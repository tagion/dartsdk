// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.7

import 'package:expect/expect.dart';

@pragma('dart2js:noInline')
method<T>() {
  /*omit.*/
  /*strong|dart2js:nnbd.fields=[T],free=[T]*/
  dynamic local() => <T>[];
  return local;
}

@pragma('dart2js:noInline')
test(o) => o == null;

main() {
  Expect.isTrue(test(method<int>().call()));
  Expect.isTrue(test(method<String>().call()));
  Expect.isFalse(test(null));
}

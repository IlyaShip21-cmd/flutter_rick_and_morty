import 'package:flutter/widgets.dart';

extension Spacing on num {
  SizedBox get vs => SizedBox(width: toDouble());
  SizedBox get hs => SizedBox(height: toDouble());
}

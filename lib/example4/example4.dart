import 'package:flutter/material.dart';
import 'package:flutter_rxdart_examples/main.dart';
import 'package:rxdart/rxdart.dart';


class Example4 extends StatelessWidget {
  const Example4({super.key});
  void testIt() async {
    final stream1 = Stream<int>.periodic(const Duration(seconds: 2), (i) => i*100);
    final stream2 = Stream<String>.periodic(const Duration(seconds: 1), (i) => 'stream2: $i');
    final concat = Rx.zip2(stream1, stream2, (a, b) => 'Zipped result $a, $b');
    await for (final value in concat) {
      value.log();
    }
  }
  @override
  Widget build(BuildContext context) {
    testIt();
    return Container();
  }
}
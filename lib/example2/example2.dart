import 'package:flutter/material.dart';
import 'package:flutter_rxdart_examples/main.dart';
import 'package:rxdart/rxdart.dart';


class Example2 extends StatelessWidget {
  const Example2({super.key});
  void testIt() async {
    final stream1 = Stream<String>.fromIterable(['stream1: hx', 'stream1: zz', 'stream1: zz']);
    final stream2 = Stream.periodic(const Duration(seconds: 1), (i) => 'stream2: $i');
    final concat =stream1.concatWith([stream2]);
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
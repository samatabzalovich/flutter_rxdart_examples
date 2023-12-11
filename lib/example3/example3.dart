import 'package:flutter/material.dart';
import 'package:flutter_rxdart_examples/main.dart';
import 'package:rxdart/rxdart.dart';


class Example3 extends StatelessWidget {
  const Example3({super.key});
  void testIt() async {
    final stream1 = Stream<String>.periodic(const Duration(seconds: 5), (i) => 'stream1: $i');
    final stream2 = Stream.periodic(const Duration(seconds: 1), (i) => 'stream2: $i');
    final concat =stream1.mergeWith([stream2]);
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
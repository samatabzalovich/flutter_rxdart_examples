import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:developer' as devtools show log;
extension Log on Object {
  void log() => devtools.log(toString());
}
class Example1 extends StatelessWidget {
  const Example1({super.key});
  void testIt() async {
  final stream1 = Stream.periodic(const Duration(seconds: 1), (count) => "Stream1 count: $count");
  final stream2 = Stream.periodic(const Duration(seconds: 2), (count) => "Stream2 count: $count");
  final combined = Rx.combineLatest2(stream1, stream2, (a, b) => "first $a, second $b");
  await for (final value in combined) {
    value.log();
  }
}
  @override
  Widget build(BuildContext context) {
    testIt();
    return Container();
  }
}
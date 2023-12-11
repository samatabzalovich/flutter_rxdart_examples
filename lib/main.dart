import 'package:flutter/material.dart';
import 'package:flutter_rxdart_examples/example1/example1.dart';
import 'package:flutter_rxdart_examples/example2/example2.dart';
import 'dart:developer' as devtools show log;

import 'package:flutter_rxdart_examples/example3/example3.dart';
import 'package:flutter_rxdart_examples/example4/example4.dart';




void main() {
  runApp(
    const App(),
  );
}
extension Log on Object {
  void log() => devtools.log(toString());
}
class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Example4(),
      ),
    );
  }
}
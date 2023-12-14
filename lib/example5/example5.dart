import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
class Example5 extends StatefulWidget {
  const Example5({Key? key}) : super(key: key);

  @override
  State<Example5> createState() => _HomePageState();
}

class _HomePageState extends State<Example5> {
  late final BehaviorSubject<DateTime> subject;
  late final Stream<String> streamOfStrings;

  @override
  void initState() {
    super.initState();
    subject = BehaviorSubject<DateTime>();
    streamOfStrings = subject.switchMap(
      (dateTime) => Stream.periodic(
        const Duration(seconds: 1),
        (count) => 'Stream count = $count, dateTime = $dateTime',
      ),
    );
  }

  @override
  void dispose() {
    subject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        
        children: [
          StreamBuilder(
              stream: streamOfStrings,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final string = snapshot.requireData;
                  return Text(string);
                } else {
                  return const Text('Waiting for the button to be pressed');
                }
              },
            
          ),
          TextButton(
            onPressed: () {
              subject.add(DateTime.now());
            },
            child: const Text('Start the stream'),
          )
        ],
      ),
    );
  }
}
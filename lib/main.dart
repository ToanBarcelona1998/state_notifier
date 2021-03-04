import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:state_notify/state_notifier.dart';
import 'package:state_notify/state_notifier_list.dart';

void main() {
  // runApp(MultiProvider(
  //   providers: [
  //     StateNotifierProvider<MyStateNotifier, Person>(
  //       create: (_) {
  //         return MyStateNotifier();
  //       },
  //     ),
  //   ],
  //   child: MyApp(),
  // ));
  runApp(
    MultiProvider(
      providers: [
        StateNotifierProvider<ListCounterNotifier, ListCounter>(
          create: (_) => ListCounterNotifier(),
        )
      ],
      child: HomeApp(),
    ),
  );
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.watch<ListCounter>().list.toString()),
            RaisedButton(
              onPressed: () {
                context.read<ListCounterNotifier>().addCounter();
              },
              child: Text("Add"),
            ),
            RaisedButton(
              onPressed: () {
                context.read<ListCounterNotifier>().removeCounter();
              },
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  String name1;
  int age1, id1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                TextField(
                  onChanged: (id) {
                    id1 = int.parse(id);
                  },
                ),
                TextField(
                  onChanged: (age) {
                    age1 = int.parse(age);
                  },
                ),
                TextField(
                  onChanged: (name) {
                    name1 = name;
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    context.read<MyStateNotifier>().person(id1, age1, name1);
                  },
                  child: Text("Update"),
                ),
                Text(
                    "${context.watch<Person>().id} ${context.watch<Person>().age} ${context.watch<Person>().name}")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

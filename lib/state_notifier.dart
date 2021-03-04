import 'package:state_notifier/state_notifier.dart';

class Person {
  int id;
  int age;
  String name;

  Person({this.id, this.age, this.name});
}

class MyStateNotifier extends StateNotifier<Person> {
  MyStateNotifier() : super(Person());

  person(int id,int age,String name){
    state=Person(id: state.id=id,age: state.age=age,name: state.name=name);
  }

  @override
  void set state(Person value) {
    // TODO: implement state
    super.state = value;
  }
}

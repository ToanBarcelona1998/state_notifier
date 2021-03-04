import 'package:state_notifier/state_notifier.dart';

class Counter{
  int counter;
  Counter({this.counter});
  @override
  String toString() {
    // TODO: implement toString
    return counter.toString();
  }
}
class ListCounter{
  List<Counter> list;
  ListCounter({this.list});
}
class ListCounterNotifier extends StateNotifier<ListCounter>{
  ListCounterNotifier() : super(ListCounter(list: []));

  addCounter(){
    state=ListCounter(list: state.list);
    state.list.add(Counter(counter: 7));
  }
  removeCounter(){
    state.list.removeAt(3);
    state=ListCounter(list: state.list);
  }

  @override
  void set state(ListCounter value) {
    // TODO: implement state
    super.state = value;
  }
}
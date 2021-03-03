import 'package:state_notifier/state_notifier.dart';

class MyState{
  int count;
  String name="";
  MyState({this.count=100,this.name});
}
class MyStateNotifier extends StateNotifier<MyState>{
  List<MyState> list=[];
  MyStateNotifier() :super(MyState());

  increment(){
    list.add(MyState(count: state.count,name: state.name));
  }
  @override
  void set state(MyState value) {
    // TODO: implement state
    super.state = value;
  }
}
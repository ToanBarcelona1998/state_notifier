import 'package:state_notifier/state_notifier.dart';
import 'package:state_notify/models/data_product.dart';
import 'package:state_notify/models/product.dart';

class ProductNotifier extends StateNotifier<List<Product>>{
  ProductNotifier() : super([]);

  allProduct(){
    return state=data_product.toList();
  }

  @override
  void set state(List<Product> value) {
    // TODO: implement state
    super.state = value;
  }
}
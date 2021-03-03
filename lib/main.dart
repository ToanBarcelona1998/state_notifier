import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:state_notify/models/product.dart';
import 'package:state_notify/providers/product_notifier.dart';
import 'views/card_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        StateNotifierProvider<ProductNotifier, List<Product>>(
            create: (_) => ProductNotifier())
      ],
      child: MaterialApp(
        home: ProductPage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightAppBar = MediaQuery.of(context).padding.top + 56;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffffa3a7), Color(0xfffd76ad)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: heightAppBar,
                width: width,
                child: appBar(context),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: heightAppBar),
              height: double.infinity,
              child: body(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Product".toUpperCase(),
            style: TextStyle(
                fontSize: 22,
                color: Color(0xffffffff),
                fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CardPage()));
            },
            child: Icon(
              Icons.wallet_giftcard_sharp,
              color: Color(0xffffffff),
            ),
          ),
        ],
      ),
    );
  }

  Widget body(BuildContext context) {
    context.read<ProductNotifier>().allProduct();
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: context.watch<List<Product>>().length,
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xfff5f5f5),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Text(
                    context.select((List<Product> list) => list[index].id.toString()),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      context.select((List<Product> list) => list[index].name.toString()),
                      textAlign: TextAlign.center,
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "${context.select((List<Product> list) => list[index].prince.toString())} VNĐ",
                      textAlign: TextAlign.center,
                    )),
                InkWell(
                    child: Icon(context.watch<Product>().isCard == false
                        ? Icons.add_box_outlined
                        :Icons.check),
                    onTap: () {}
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

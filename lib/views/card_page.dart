import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Card".toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(flex: 3,child: Container(
              child: ListView.builder(itemBuilder: (context,index){
                return Card();
              }),
            ),),
            Expanded(flex: 1,child: Container(
              alignment: Alignment.center,
              child: Text("Tổng giá\n"),
            )),
          ],
        ),
      ),
    );
  }
}

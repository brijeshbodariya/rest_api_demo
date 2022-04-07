import 'package:flutter/material.dart';
import 'package:rest_api_demo/fruit.dart';
import 'package:rest_api_demo/fruit_item.dart';

class FruitList extends StatelessWidget {
  final List<Fruit>? items;

  const FruitList({Key? key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items!.length,
      itemBuilder: (context, index) {
        return FruitItem(item: items![index]);
      },
    );
  }
}

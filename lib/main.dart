import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'fruit.dart';
import 'fruit_list.dart';
import 'operation.dart';

void main() => runApp(MyApp(products: fetchFruit()));

class MyApp extends StatelessWidget {
  final Future<List<Fruit>>? products;

  const MyApp({Key? key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(products: products!),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Future<List<Fruit>>? products;

  const MyHomePage({Key? key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Rest API Demo"),
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<List<Fruit>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                if (kDebugMode) {
                  print(snapshot.error);
                }
              }
              return snapshot.hasData
                  ? FruitList(items: snapshot.data!)
                  : const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}

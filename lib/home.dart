import 'package:flutter/material.dart';
import 'package:miniproject/FavoriteView.dart';
import 'package:miniproject/card_view.dart';
import 'package:miniproject/data/product_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List carditom = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(carditom.length.toString()),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteView(items: productdata),
                  ),
                );
              },
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: productdata.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: ListTile(
                  tileColor: Colors.grey,
                  title: Text(productdata[index]["name"]),
                  subtitle: Text(productdata[index]["price"].toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            productdata[index]["isfav"] =
                                !productdata[index]["isfav"];
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: productdata[index]["isfav"] == true
                              ? Colors.red
                              : Colors.yellowAccent,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            carditom.add(productdata[index]);
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CardView(
                          items: carditom,
                        )));
            setState(() {});
          },
          child: const Icon(Icons.home),
        ),
      ),
    );
  }
}

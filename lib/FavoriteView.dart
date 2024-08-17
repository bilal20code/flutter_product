import 'package:flutter/material.dart';

class FavoriteView extends StatefulWidget {
  final List items;
  const FavoriteView({super.key, required this.items});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    List favoriteItems = widget.items.where((item) => item["isfav"] == true).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Items"),
      ),
      body: favoriteItems.isEmpty
          ? const Center(child: Text("No Favorite Items"))
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${favoriteItems[index]["name"]}"),
                  subtitle: Text("${favoriteItems[index]["price"]}"),
                  trailing: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        favoriteItems.removeAt(index);
                        widget.items
                            .firstWhere((item) =>
                                item["name"] == favoriteItems[index]["name"])
                            ["isfav"] = false;
                      });
                    },
                    child: const Text("-"),
                  ),
                );
              },
            ),
    );
  }
}

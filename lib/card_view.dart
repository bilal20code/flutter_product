import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  final List items;
  const CardView({super.key, required this.items});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("card View"),
      ),
      body: widget.items.isEmpty
          ? const Center(child: Text("Empty List"))
          : ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${widget.items[index]["name"]}"),
                  subtitle: Text("${widget.items[index]["price"]}"),
                  trailing: ElevatedButton(onPressed: (){
                    setState(() {
                      widget.items.removeAt(index);
                    });
                  },
                   child: const Text("-")),
                );
              },
            ),
    );
  }
}

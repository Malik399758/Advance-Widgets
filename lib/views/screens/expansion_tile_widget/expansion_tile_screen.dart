
import 'package:flutter/material.dart';

class ExpansionTileScreen extends StatefulWidget {
  const ExpansionTileScreen({super.key});

  @override
  State<ExpansionTileScreen> createState() => _ExpansionTileScreenState();
}

class _ExpansionTileScreenState extends State<ExpansionTileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Tile Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ExpansionTile(title: Text('Item 1'),children: [
            Text('This is item 1')
          ],),
          ExpansionTile(title: Text('Item 2'),children: [
            Text('This is item 2')
          ],),
          ExpansionTile(
            title: Text("What is Flutter?"),
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Flutter is an open-source UI toolkit by Google for building "
                      "beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.",
                ),
              )
            ],
          ),
          ExpansionTile(
            title: Text("Tap to Expand"),
            subtitle: Text("This is a subtitle"),
            leading: Icon(Icons.info),
            children: [
              ListTile(title: Text("Item 1")),
              ListTile(title: Text("Item 2")),
              ListTile(title: Text("Item 3")),
            ],
          )


        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class ExpansionTileListScreen extends StatefulWidget {
  const ExpansionTileListScreen({super.key});

  @override
  State<ExpansionTileListScreen> createState() => _ExpansionTileListScreenState();
}

class _ExpansionTileListScreenState extends State<ExpansionTileListScreen> {

  final List<String> item = List.generate(100, (index) => 'Item ${index + 1}');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Tile List'),
      ),
      body: ListView.builder(
         physics: ClampingScrollPhysics(),
          itemCount: item.length,
          itemBuilder: (context,index){
         return ExpansionTile(
           backgroundColor: Colors.blue.shade50,
           // collapsedBackgroundColor: Colors.grey.shade200,
           // childrenPadding: EdgeInsets.all(16),
           title: Text(item[index]),
         children: [
           Align(
             alignment: Alignment.topLeft,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text('Details of ${item[index]}'),
               ))
         ],);
      })
    );
  }
}

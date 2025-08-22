
import 'package:flutter/material.dart';

class DismissibleScreen extends StatefulWidget {
  const DismissibleScreen({super.key});

  @override
  State<DismissibleScreen> createState() => _DismissibleScreenState();
}

class _DismissibleScreenState extends State<DismissibleScreen> {
  List<String> names = ['yaseen','basit','ahmad'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible Screen'),
      ),
      body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context,index){
            return Dismissible(
                key: Key(names[index]),
                background: Container(
                  color: Colors.green,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.check,color: Colors.white,),
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction){
                  String removedName = names[index]; // yaseen basit ahmad
                  setState(() {
                    names.removeAt(index); // basit remove
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$removedName dismissed")),
                  );
                },
                child: ListTile(
                  title: Text(names[index]),
                ));
          }),
    );
  }
}

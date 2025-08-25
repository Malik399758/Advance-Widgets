
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  final List favoriteItem;
  const FavoriteScreen({super.key,required this.favoriteItem});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Screen'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: widget.favoriteItem.length,
          itemBuilder: (context,index){
        return Card(
          child: ListTile(
            title: Text(widget.favoriteItem[index]),
            trailing: GestureDetector(
              onTap: (){
                setState(() {
                  widget.favoriteItem.removeAt(index);
                });
              },
                child: Icon(Icons.favorite)),
          ),
        );
      })
    );
  }
}

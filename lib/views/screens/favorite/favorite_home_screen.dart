
import 'package:advance_widgets/views/screens/favorite/favorite_screen.dart';
import 'package:flutter/material.dart';

class FavoriteHomeScreen extends StatefulWidget {
  const FavoriteHomeScreen({super.key});

  @override
  State<FavoriteHomeScreen> createState() => _FavoriteHomeScreenState();
}

class _FavoriteHomeScreenState extends State<FavoriteHomeScreen> {
  // list of items
  List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
  int count = 0;

  // increase count
  void countIncrease(){
    setState(() {
      count++;
    });
  }

  // decrease count
  void countDecrease(){
    setState(() {
      count--;
    });
  }

  // list of favorite items
  List<String> selectedItem = [];

  List<bool> isActive = [];

  // true or false
  void toggleFavorite(int index){
    setState(() {
      isActive[index] = !isActive[index];
    });
  }

  // if the item is not exist in the list the add it else remove it
  void selectedItems(String item){
    if(!selectedItem.contains(item)){
      setState(() {
        selectedItem.add(item);
      });
    }else{
      setState(() {
        selectedItem.remove(item);
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // here always false
    isActive = List.generate(items.length,(_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        actions: [
          Stack(
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        FavoriteScreen(favoriteItem: selectedItem)));
                  },
                  child: Icon(Icons.favorite,size: 30,)),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle
                ),
                child: Center(child: Text(count.toString(),style: TextStyle(fontSize: 7),)),
              )
            ],

          )
        ],
        title: Text('Favorite Home Screen'),
        centerTitle: true,
      ),
      body:ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Text('${items[index]}'),
                trailing: GestureDetector(
                  onTap: (){
                    toggleFavorite(index);
                    selectedItems(items[index]);
                    if(isActive[index]){
                      countIncrease();
                    }else{
                      countDecrease();
                    }

                  },
                    child: isActive[index] ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
              ),
            );

      })
    );
  }
}

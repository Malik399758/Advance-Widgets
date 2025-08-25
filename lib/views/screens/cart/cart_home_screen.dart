
import 'package:advance_widgets/controllers/count_provider.dart';
import 'package:advance_widgets/controllers/items_controller.dart';
import 'package:advance_widgets/models/items_models.dart';
import 'package:advance_widgets/views/screens/cart/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartHomeScreen extends StatefulWidget {
  const CartHomeScreen({super.key});

  @override
  State<CartHomeScreen> createState() => _CartHomeScreenState();
}

class _CartHomeScreenState extends State<CartHomeScreen> {

  //int count = 0;

  final itemList = ItemsController().getItems();

  // empty list
  List<ItemsModel> list = [];

  void selectedItems(ItemsModel item){
    if(!list.contains(item)){
      list.add(item);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text('Product added to cart')));
      //countIncrease();
      Provider.of<ItemProvider>(context,listen: false).countIncrement();
    }else if(list.contains(item)){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text('Item already added')));
    } else{
      list.remove(item);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text('Product removed from cart')));
      //countDecrease();
      Provider.of<ItemProvider>(context,listen: false).countDecrement();
    }
  }

  /*// count increment
  void countIncrease(){
    setState(() {
      count++;
    });
  }

  // count decrement
  void countDecrease(){
    setState(() {
      count--;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          CartScreen(itemsCart: list)));
                    },
                    child: Icon(CupertinoIcons.cart,size: 30,)),
                Positioned(
                  top: -4,
                  right: -3,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green
                    ),
                    child: Center(child: Text(Provider.of<ItemProvider>(context).count.toString(),style: TextStyle(
                      fontSize: 10,color: Colors.white
                    ),)),
                  ),
                )
              ],

            ),
          )
        ],
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context,index){
            final item = itemList[index];
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            child: ListTile(
              leading: Image.asset(item.image,height: 100,width: 80,),
              title: Text(item.name),
              subtitle: Text('${item.type} \$${item.price}'),
              trailing: GestureDetector(
                onTap: (){
                  selectedItems(item);
              },
                child: Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(child: Text('Add to cart',style: TextStyle(fontSize: 10,color: Colors.white),)),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}


import 'package:advance_widgets/controllers/items_controller.dart';
import 'package:flutter/material.dart';

class CartHomeScreen extends StatefulWidget {
  const CartHomeScreen({super.key});

  @override
  State<CartHomeScreen> createState() => _CartHomeScreenState();
}

class _CartHomeScreenState extends State<CartHomeScreen> {

  final itemList = ItemsController().getItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              leading: Image.asset(item.image),
              title: Text(item.name),
              subtitle: Text('${item.type} \$${item.price}'),
              trailing: Expanded(
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

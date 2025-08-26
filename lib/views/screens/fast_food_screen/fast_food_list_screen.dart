
import 'package:advance_widgets/controllers/fast_food_controller.dart';
import 'package:advance_widgets/models/fast_food_mock_data.dart';
import 'package:advance_widgets/models/fast_food_model.dart';
import 'package:advance_widgets/views/screens/fast_food_screen/fast_food_cart_screen.dart';
import 'package:flutter/material.dart';

class FastFoodListScreen extends StatefulWidget {
  const FastFoodListScreen({super.key});

  @override
  State<FastFoodListScreen> createState() => _FastFoodListScreenState();
}

class _FastFoodListScreenState extends State<FastFoodListScreen> {
  List<bool> isActive = [];

  // selected item list
  List<FastFoodModel> selectedList = [];


  final fastFoodItems = FastFoodController().getFastFood();

  void toggle(int index){
    setState(() {
      isActive[index] = !isActive[index];
    });
  }


  void selectedItemList(FastFoodModel food){
    if(!selectedList.contains(food)){
      setState(() {
        selectedList.add(food);
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text('Product added into cart')));
    }else{
      setState(() {
        selectedList.remove(food);
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text('Product removed from cart')));
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isActive = List.generate(fastFoodItems.length, (index) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FastFoodCartScreen(fastFastItem: selectedList)));
                },
                child: Icon(Icons.shopping_bag)),
          )
        ],
        title: Text('Persistent Shopping Cart',style: TextStyle(
          fontSize: 14
        ),),
        centerTitle: true,
      ),
      body: fastFoodItems.isEmpty ? Center(child: Text('No item found')) :
          ListView.builder(
              itemCount: fastFoodItems.length,
              itemBuilder: (context,index){
                final item = fastFoodItems[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                child: Row(
                  children: [
                    Image.asset(item.image,width: 80,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name,style: TextStyle(fontSize: 15),),
                          SizedBox(height: 4,),
                          Text(
                            item.title,
                            style: const TextStyle(fontSize: 12, color: Colors.white),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4,),
                          Text('\$${item.price}'),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: (){
                                toggle(index);
                                selectedItemList(item);
                              },
                              child: isActive[index] ? Container(
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.red
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(child: Text('Remove',style: TextStyle(fontSize: 10),)),
                              )  : Container(
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(child: Text('Add to cart',style: TextStyle(fontSize: 10),)),
                              )
                            ),
                          )

                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          })
    );
  }
}

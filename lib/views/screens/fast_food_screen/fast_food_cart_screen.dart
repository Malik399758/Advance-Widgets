
import 'package:advance_widgets/models/fast_food_model.dart';
import 'package:flutter/material.dart';

class FastFoodCartScreen extends StatefulWidget {
  List<FastFoodModel> fastFastItem;
  FastFoodCartScreen({super.key,required this.fastFastItem});

  @override
  State<FastFoodCartScreen> createState() => _FastFoodCartScreenState();
}

class _FastFoodCartScreenState extends State<FastFoodCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        centerTitle: true,
      ),
      body: widget.fastFastItem.isEmpty ? Text('Empty Cart') :
          ListView.builder(
              itemCount: widget.fastFastItem.length,
              itemBuilder: (context,index){
                final item = widget.fastFastItem[index];
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
                         /* Align(
                            alignment: Alignment.bottomRight,
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
                            ),
                          )*/

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

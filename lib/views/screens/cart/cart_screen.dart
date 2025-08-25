
import 'package:advance_widgets/controllers/count_provider.dart';
import 'package:advance_widgets/models/items_mock_data.dart';
import 'package:advance_widgets/models/items_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  final List<ItemsModel> itemsCart;
  const CartScreen({super.key,required this.itemsCart});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  late List<int> itemCounts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.itemsCart.isNotEmpty) {
      itemCounts = List.generate(widget.itemsCart.length, (index) => 1);
    } else {
      itemCounts = [];
    }
  }

  void countIncrease(int index){
    setState(() {
      itemCounts[index]++;
    });
  }

  void countDecrease(int index){
    if(itemCounts[index] > 1){
      setState(() {
        itemCounts[index]--;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        centerTitle: true,
      ),
      body: widget.itemsCart.isEmpty ? Center(child: Text('Cart Empty')) :
          ListView.builder(
              itemCount: widget.itemsCart.length,
              itemBuilder: (context,index){
                final item = widget.itemsCart[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white
                  ),
                  child: Row(
                    children: [
                      Image.asset(item.image,width: 100,),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name),
                          SizedBox(height: 8,),
                          Text('${item.type} \$${item.price * itemCounts[index]}')
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap : (){
                                setState(() {
                                  widget.itemsCart.remove(item);
                                  Provider.of<ItemProvider>(context,listen: false).countDecrement();
                                });

                      },
                                child: Icon(Icons.delete)),
                            SizedBox(height: 10,),
                            Container(
                              width: 80,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(6)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap : (){
                                countDecrease(index);
                            },
                                      child: Icon(CupertinoIcons.minus,size: 16,color: Colors.white,)),
                                  SizedBox(width: 4,),
                                  Text(itemCounts[index].toString(),style: TextStyle(color: Colors.white),),
                                  SizedBox(width: 4,),
                                  GestureDetector(
                                    onTap: (){
                                      countIncrease(index);
                                    },
                                      child: Icon(Icons.add,size: 16,color: Colors.white,)),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                
                    ],
                  ),
                ),
              ),
            );
          })

    );    
  }
}

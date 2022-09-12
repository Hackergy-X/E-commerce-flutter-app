import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import '../model/item.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    final cartClone = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 141, 95),
        title: Text("Checkout"),
        actions: [
          Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                              child:  Text(
                                "${cartClone.selectedProduct.length}",
                                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(211, 164, 255, 193),
                                  shape: BoxShape.circle)),

                          IconButton(
                              onPressed: () { },
                              icon: Icon(Icons.add_shopping_cart)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text("\$ ${cartClone.price}"),
                      ),
                    ]
                ),
        ],
      ),
      body:  Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: cartClone.selectedProduct.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: ListTile(
                      subtitle: Text("${cartClone.selectedProduct[index].price} - ${cartClone.selectedProduct[index].location}"),
                      leading: CircleAvatar(backgroundImage:AssetImage(cartClone.selectedProduct[index].imgPath),),
                      title: Text("${cartClone.selectedProduct[index].name}"),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              cartClone.removePr(items[index]);
                            });
                          },
                          icon: Icon(Icons.remove)),
                    ),);
                },
              ),
            ),
          ),
          ElevatedButton(onPressed: (){},
              child: Text("Pay \$${cartClone.price}", style: TextStyle(fontSize: 18)),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              padding: MaterialStateProperty.all(EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              )
            ),
          )
        ],
      )
    );
  }
}

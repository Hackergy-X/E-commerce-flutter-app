import 'package:flutter/material.dart';
import '../model/item.dart';
import '../provider/cart.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {

  Item product;
  DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => DetailsScreenState();
}


class DetailsScreenState extends State<DetailsScreen> {

  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        title: Text("Details"),
        actions: [
          Consumer<Cart>(
              builder: ((context, cartClone, child) {
                //open consumer
                return Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                              child: Text(
                                "${cartClone.itemCount}",
                                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(211, 164, 255, 193),
                                  shape: BoxShape.circle)),

                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("checkout");
                              },
                              icon: Icon(Icons.add_shopping_cart)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text("\$ ${cartClone.price}"),
                      ),
                    ]
                );
              })),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.product.imgPath, width: double.infinity, height: 400,),
            SizedBox(
              height: 10,
            ),
            Text("\$ ${widget.product.price}", style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text("New",style: TextStyle(fontSize: 15),),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 39, 100),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 191, 0),),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 191, 0),),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 191, 0),),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 191, 0),),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 191, 0),),
                SizedBox(
                  width: 100,
                ),
                Icon(Icons.edit_location, color: Color.fromARGB(255, 76, 141, 95),),
                SizedBox(
                  width: 5,
                ),
                Text("${widget.product.location}", style: TextStyle(fontSize: 14),),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 10),
              child: Text("Details: ", style: TextStyle(fontSize: 20),
              textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("(Entry 1 of 2) 1a : the specialized part of an"
                " angiospermous plant that occurs singly or in c"
                "lusters, possesses whorls of often colorfu"
                "l petals or sepals, and bears the reproductiv"
                "e structures (such as stamens or pistils) involv"
                "ed in the development of seeds and fruit : blossom.",
            style: TextStyle(fontSize: 14),
              maxLines: isShow ? 3 : null,
              overflow: TextOverflow.fade,
            ),
            TextButton(onPressed: (){
              setState(() {
                isShow = !isShow;
              });
            }, child: Text("${isShow?"Show more":"Show less"}"))
          ],
        ),
      ),
    );
  }
}

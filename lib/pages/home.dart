import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './details_screen.dart';
import '../model/item.dart';
import '../provider/cart.dart';


class Home extends StatefulWidget {
  const Home({ super.key });

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/bg.jpg"),
                          fit: BoxFit.cover),
                    ),
                    accountName: Text("Mr.achwas",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        )),
                    accountEmail: Text("achwas@gmail.com"),
                    currentAccountPictureSize: Size.square(99),
                    currentAccountPicture: CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage("assets/img/user-logo.png")),
                  ),

                  ListTile(
                      title: Text("Home"),
                      leading: Icon(Icons.home),
                      onTap: () {
                        Navigator.of(context).pushNamed("home");
                      }
                  ),

                  ListTile(
                      title: Text("My products"),
                      leading: Icon(Icons.add_shopping_cart),
                      onTap: () {
                        Navigator.of(context).pushNamed("checkout");
                      }
                  ),

                  ListTile(
                      title: Text("About"),
                      leading: Icon(Icons.help_center),
                      onTap: () {
                        Navigator.of(context).pushNamed("about");
                      }
                  ),

                  ListTile(
                      title: Text("Logout"),
                      leading: Icon(Icons.exit_to_app),
                      onTap: () { }
                  ),

                ],
              ),

              Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Text("Developed by Omar Ghieh © 2022",
                    style: TextStyle(fontSize: 14)),
              )
            ],
          ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        title: Text("Home"),
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
      body:  GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 33),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return  Container(
              padding: EdgeInsets.all(11),
              child: GridTile(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(product: items[index]),
                        ),
                      );
                    },
                    child: Image.asset("${items[index].imgPath}")
                ),

                footer: GridTileBar(
                  trailing: Consumer<Cart>(
                      builder: ((context, cartClone, child) {
                        return IconButton(
                            color: Color.fromARGB(255, 62, 94, 70),
                            onPressed: () {
                              cartClone.add(items[index]);
                            },
                            icon: Icon(Icons.add),
                      );
                      }
            )),
                  leading: Text("\$ ${items[index].price}"),

                  title: Text("",),
                ),  ),
            );
          }),
    );
  }
}
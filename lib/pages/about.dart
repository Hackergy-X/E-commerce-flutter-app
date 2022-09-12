import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    final cartClone = Provider.of<Cart>(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(
              children: [
                const UserAccountsDrawerHeader(
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
                    title: const Text("Home"),
                    leading: const Icon(Icons.home),
                    onTap: () {
                      Navigator.of(context).pushNamed("home");
                    }
                ),

                ListTile(
                    title: const Text("My products"),
                    leading: const Icon(Icons.add_shopping_cart),
                    onTap: () {
                      Navigator.of(context).pushNamed("checkout");
                    }
                ),

                ListTile(
                    title: const Text("About"),
                    leading: const Icon(Icons.help_center),
                    onTap: () {
                      Navigator.of(context).pushNamed("about");
                    }
                ),

                ListTile(
                    title: const Text("Logout"),
                    leading: const Icon(Icons.exit_to_app),
                    onTap: () { }
                ),

              ],
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: const Text("Developed by Omar Ghieh © 2022",
                  style: TextStyle(fontSize: 14)),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 141, 95),
        title: const Text("About"),
        actions: [
          Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                              child: Text(
                                "${cartClone.itemCount}",
                                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(211, 164, 255, 193),
                                  shape: BoxShape.circle)),

                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("checkout");
                              },
                              icon: const Icon(Icons.add_shopping_cart)),
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
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/logo.webp", width: 280, height: 250,),
            Text("This is Flower Shop App, builded it using flutter,"
                " you can in this app to sell any flower you want,"
                " by click on the add icon to add it to product cart on the top,"
                " and ofcorse you can remove any product from the list of products,"
                " and when you finish you can press on the Pay to pay the payment of all the products you selected.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 50,
            ),
            Text("Thank you for visiting my App",
            style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(
              height: 15,
            ),
            Text("Developed by Omar Ghieh © 2022",
                style: TextStyle(fontSize: 15, color: Colors.green,))
          ],
        ),
      ),
    );
  }
}

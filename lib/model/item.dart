class Item {
  late String imgPath;
  late double price;
  late String location;
  late String name;

  Item({required this.name, required this.imgPath, required this.price, this.location = "Main branch"});
}

final List<Item> items = [
  Item(name: "Flower Faw",price: 12.99, imgPath: "assets/img/1.webp", location: "Flower shop"),
  Item(name: "Flower Gwe",price: 20.99, imgPath: "assets/img/2.webp", location: "Flower shop"),
  Item(name: "Flower TEww",price: 10.99, imgPath: "assets/img/3.webp", location: "Flower shop"),
  Item(name: "Flower Gows",price: 50.99, imgPath: "assets/img/4.webp", location: "Flower shop"),
  Item(name: "Flower Bow",price: 30.99, imgPath: "assets/img/5.webp", location: "Flower shop"),
  Item(name: "Flower Haw",price: 40.99, imgPath: "assets/img/6.webp", location: "Flower shop"),
  Item(name: "Flower VAcc",price: 8.99, imgPath: "assets/img/7.webp", location: "Flower shop"),
  Item(name: "Flower Tar",price: 5.99, imgPath: "assets/img/8.webp", location: "Flower shop"),
];
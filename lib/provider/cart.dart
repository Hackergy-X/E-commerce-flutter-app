import 'package:flutter/material.dart';
import '../model/item.dart';


class Cart with ChangeNotifier {

  List selectedProduct = [];
  double price = 0.0;

  add(Item product){
    selectedProduct.add(product);
    price += product.price.round();
    notifyListeners();
  }

  removePr(Item product){
    selectedProduct.remove(product);
    price -= product.price.round();
    if(price == 0){
      price = 0;
    }
    notifyListeners();
  }


  get itemCount{
    return selectedProduct.length;
  }

}
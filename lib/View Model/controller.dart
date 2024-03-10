import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hardware_pro/Model/cartmodel.dart';

class Controller with ChangeNotifier {
  bool isObsecure = true;

  void showpassword() {
    isObsecure = !isObsecure;
    notifyListeners();
  }

  hello() {
    print("hello");
  }

  bool isAddIconPressed = false;
  bool isRemoveIconPressed = false;
  int totalprice = 0;
  int finalPrice = 0;
  Future incrementCounter(maxQuantity, quantity, price) async {
    if (maxQuantity > quantity) {
      quantity++;
      notifyListeners();
      isAddIconPressed = true;
      isRemoveIconPressed = false;
      totalprice = (price * quantity);

      Map<String, dynamic> data = {
        "quantity": quantity,
        "ttlprice": totalprice
      };
      notifyListeners();
      return data;
    }
    notifyListeners();
  }

  Future decrementCounter(int price, quantity) async {
    if (quantity > 0) {
      quantity--;
      isAddIconPressed = false;
      isRemoveIconPressed = true;

      totalprice = (totalprice - price);

      Map<String, dynamic> data = {
        "quantity": quantity,
        "ttlprice": totalprice
      };
      notifyListeners();
      return data;
    }
    notifyListeners();
    // return data;
  }

  Future<int> assignTototalPrice(List<CartModel> list) async {
    finalPrice = 0;
    for (var i in list) {
      finalPrice = finalPrice + i.totalAmount.toInt();
      print(finalPrice);
    }
    return finalPrice;
  }

  clearData() {
    totalprice = 0;

    notifyListeners();
  }

  //-------------------radiobutton
  int selectedRadioButton = 1;
 int  onselectedRadio(value) {
    selectedRadioButton = value;
    notifyListeners();
    return value;
  }
}

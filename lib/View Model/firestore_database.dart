import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hardware_pro/Model/addressModel.dart';
import 'package:hardware_pro/Model/cartmodel.dart';
import 'package:hardware_pro/Model/notification_model.dart';
import 'package:hardware_pro/Model/order_model.dart';
import 'package:hardware_pro/Model/productmodel.dart';
import 'package:hardware_pro/Model/register_complaint_model.dart';
import 'package:hardware_pro/Model/user_model.dart';
import 'package:hardware_pro/Model/warrenty_model.dart';

class FirestoreDatabase with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  //-------------------------------create-----------------------

  Future addUser(uid, UserModel usermodel) async {
    await db.collection("User").doc(uid).set(usermodel.toJson(
          uid,
        ));
  }

  Future addNewAddress(UserAddressModel userAddressModel) async {
    final docs = db
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("adress")
        .doc();
    await docs.set(userAddressModel.toJson(docs.id));
    notifyListeners();
  }

  _sendNotificationToUser(uid, NotificationModel notificationModel) async {
    final docs =
        db.collection("User").doc(uid).collection("Notification").doc();
    docs.set(notificationModel.tojson(docs.id));
  }

  Future addToCart(CartModel cartModel, proId) async {
    final docs = db
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Cart")
        .doc(proId);
    await docs.set(cartModel.toJson(docs.id, proId));
  }

  Future buyProductFromCart(
    OrderModel orderModel,
  ) async {
    final docs = db.collection("Orders").doc();
    await docs.set(orderModel.toJson(
      docs.id,
    ));
    // final map = orderModel.toJson(docs.id);
    final cartCollectionRef = db
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Cart");
    await _deleteCollection(cartCollectionRef);
    // await _addtoHistory(map);
  }

  listen() {
    notifyListeners();
  }

  Future registerNewWarrenty(
      RegisterWarrentyModel registerWarrentyModel) async {
    final docs = db.collection("Warrenty").doc();
    docs.set(registerWarrentyModel.tojson(docs.id));
  }

  Future registerNewComplaint(
      RegisterComplaintModel registerComplaintModel, date, time) async {
    final dosc = db.collection("Complaints").doc();
    dosc.set(registerComplaintModel.toJson(dosc.id));
    _sendNotificationToUser(
        FirebaseAuth.instance.currentUser!.uid,
        NotificationModel(
            notification:
                "Complaint register succesful.after the review our team will connect you\n(Complaint Id:${dosc.id})",
            date: date,
            time: time));
  }
  // _addtoHistory(Map<String, dynamic> map) {
  //   final docs = db
  //       .collection("User")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection("History")
  //       .doc();
  //   docs.set(map);
  // }

  //-------------------------------update-----------------------
  Future updateCartData(docId, quantity, total) async {
    db
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Cart")
        .doc(docId)
        .update({"quantity": quantity, "totalAmount": total});
    notifyListeners();
  }

  Future updateClaimStatus(
      docId, newStatus, NotificationModel notificationModel) async {
    db.collection('Warrenty').doc(docId).update({"claimStatus": newStatus});
    _sendNotificationToUser(
        FirebaseAuth.instance.currentUser!.uid, notificationModel);

    notifyListeners();
  }

  //------------------------------delete-------------------------
  deleteFromCart(docId) async {
    db
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Cart")
        .doc(docId)
        .delete();
    notifyListeners();
  }

  Future<void> _deleteCollection(
      CollectionReference collectionReference) async {
    final QuerySnapshot snapshot = await collectionReference.get();

    for (QueryDocumentSnapshot doc in snapshot.docs) {
      if (doc.exists) {
        await doc.reference.delete();
        notifyListeners();
      }
    }
  }

  clearAllNotification() {
    CollectionReference collection = db
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Notification");

    _deleteCollection(collection);
    notifyListeners();
  }

  deleteComplaint(complaintId, date, time) {
    print(complaintId);
    db.collection("Complaints").doc(complaintId).delete();
    _sendNotificationToUser(
        FirebaseAuth.instance.currentUser!.uid,
        NotificationModel(
            notification: "Complaint id: $complaintId\nis deleted your self",
            date: date,
            time: time));
    notifyListeners();
  }

  //--------------------------------read-------------------------
  UserModel? userModel;
  fetchUserData(uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await db.collection("User").doc(uid).get();
    if (snapshot.exists) {
      userModel = UserModel.fromJson(snapshot.data()!);
    }
  }

  List<UserAddressModel> userAdressList = [];
  fetchAllAddress() async {
    // userAdressList.sort();
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("adress")
        .get();
    userAdressList = snapshot.docs.map((e) {
      return UserAddressModel.fromJson(e.data());
    }).toList();
  }

  List<ProductModel> productList = [];
  fetchAllProduct() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection("product").get();

    productList = snapshot.docs.map((e) {
      return ProductModel.fromJson(e.data());
    }).toList();
    print(productList.length);
  }

  List<CartModel> cartmodelList = [];
  fetchCartProduct() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Cart")
        .get();
    cartmodelList = snapshot.docs.map((e) {
      return CartModel.fromJson(e.data());
    }).toList();
    print("=====================");
    print(cartmodelList.length);
  }

  List<OrderModel> myOrderList = [];
  fetchMyorder() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("Orders")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    myOrderList = snapshot.docs.map((e) {
      return OrderModel.fromJson(e.data());
    }).toList();
  }

  List<NotificationModel> notificationList = [];
  Future fectNotificationFromUser() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Notification")
        .get();
    notificationList = snapshot.docs.map((e) {
      return NotificationModel.fromJson(e.data());
    }).toList();
  }

  List<Map<String, dynamic>> listOfBroughtProduct = [];
  Future<List<Map<String, dynamic>>>
      fetchCompletedProductsNameAndOrderId() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("Orders")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("status", isEqualTo: "COMPLETED")
        .get();
    //---------------------------------------
    listOfBroughtProduct = [];

    for (var i in snapshot.docs) {
      final data = i.data();
      // print(data["orderId"]);
      // print(data["status"]);
      final cartModelList = data["cartModel"];
      String name = "";
      String productId = "";
      for (var j in cartModelList) {
        name = j["productModel"]["productName"];
        productId = j["productModel"]["productId"];
        listOfBroughtProduct.add({
          "orderId": data["orderId"],
          "productName": name,
          "productId": productId,
          "date": data['date']
        });
        // print(name);
        // print("=============");
      }
      // print("---------------------");
    }
    // print(listOfBroughtProduct);
    return listOfBroughtProduct;
  }

  List<RegisterWarrentyModel> warrentyList = [];
  fetchuserWarrnty() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("Warrenty")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    warrentyList = snapshot.docs.map((e) {
      return RegisterWarrentyModel.fromjson(e.data());
    }).toList();
  }

  List<RegisterComplaintModel> compalintsList = [];
  fetchcurrentUserComplaint() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("Complaints")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    compalintsList = snapshot.docs.map((e) {
      return RegisterComplaintModel.formJson(e.data());
    }).toList();
  }
}

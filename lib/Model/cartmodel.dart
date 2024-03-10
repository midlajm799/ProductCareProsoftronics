import 'package:hardware_pro/Model/productmodel.dart';

class CartModel {
  String? cartid;

  // List<String> serialNumber;
  ProductModel productModel;
  int quantity;
  // String serialNumber;
  // String status;

  num totalAmount;

  CartModel(
      {this.cartid,
      // required this.serialNumber,
      // required this.status,
      // required this.serialNumber,
      required this.productModel,
      required this.quantity,
      required this.totalAmount});

  Map<String, dynamic> toJson(id, proId) => {
        // "status": status,
        // "serialNumber": serialNumber,
        "productModel": productModel.toJson(proId),
        "cartid": id,
        "quantity": quantity,
        "totalAmount": totalAmount,
        // "serialNumber": serialNumber.map((e) => e)
      };
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        // status: json["status"],
        // serialNumber: json["serialNumber"],
        // serialNumber: List<String>.from(json["serialNumber"]),
        cartid: json["cartid"],
        productModel: ProductModel.fromJson(json["productModel"]),
        quantity: json["quantity"],
        totalAmount: json["totalAmount"]);
  }
}

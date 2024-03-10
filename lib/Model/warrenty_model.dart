

class RegisterWarrentyModel {
  String? warrentyId;
  String uid;
  String name;
  String email;
  int phoneNumber;
  String product;
  String productid;
  String orderId;
  String srialnumber;
  String purchaseDate;
  String warrentyStatus;
    String claimStatus;


  RegisterWarrentyModel(
      {required this.email,
      required this.claimStatus,
      this.warrentyId,
     required this. warrentyStatus,
      required this.productid,
      required this.uid,
      required this.name,
      required this.orderId,
      required this.phoneNumber,
      required this.product,
      required this.purchaseDate,
      required this.srialnumber});

  Map<String, dynamic> tojson(wid) => {
        "email": email,
        "productid": productid,
        "claimStatus":claimStatus,
"warrentyStatus":warrentyStatus,
        "warrentyId": wid,
        "uid": uid,
        "name": name,
        "orderId": orderId,
        "phoneNumber": phoneNumber,
        "product": product,
        "purchaseDate": purchaseDate,
        "srialnumber": srialnumber
      };

  factory RegisterWarrentyModel.fromjson(Map<String, dynamic> json) {
    return RegisterWarrentyModel(
        productid: json["productid"],
        claimStatus:json["claimStatus"],
        warrentyStatus:json["warrentyStatus"],
        email: json["email"],
        warrentyId: json["warrentyId"],
        uid: json["uid"],
        name: json["name"],
        orderId: json["orderId"],
        phoneNumber: json["phoneNumber"],
        product: json["product"],
        purchaseDate: json["purchaseDate"],
        srialnumber: json["srialnumber"]);
  }
}

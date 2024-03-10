class RegisterComplaintModel {
  String? complaintId;
  String uid;
  String productName;
  String productId;
  String orderId;
  String orderDate;
  String complaint;
  String complaintDate;
  String description;
  String complaintStatus;
  String contactNumber;

  RegisterComplaintModel(
      {required this.complaint,
      this.complaintId,
      required this.complaintDate,
      required this.complaintStatus,
      required this.description,
      required this.orderDate,
      required this.orderId,
      required this.productId,
      required this.productName,
      required this.contactNumber,
      required this.uid});

  Map<String, dynamic> toJson(cptId) => {
        "complaint": complaint,
        "complaintDate": complaintDate,
        "complaintId": cptId,
        "complaintStatus": complaintStatus,
        "description": description,
        "orderDate": orderDate,
        "orderId": orderId,
        "productId": productId,
        "productName": productName,
        "contactNumber": contactNumber,
        "uid": uid
      };
  factory RegisterComplaintModel.formJson(Map<String, dynamic> json) {
    return RegisterComplaintModel(
        complaintDate: json["complaintDate"],
        complaint: json["complaint"],
        complaintId: json["complaintId"],
        complaintStatus: json["complaintStatus"],
        description: json["description"],
        orderDate: json["orderDate"],
        orderId: json["orderId"],
        productId: json["productId"],
        productName: json["productName"],
        contactNumber: json["contactNumber"],
        uid: json["uid"]);
  }
}

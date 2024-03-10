class UserAddressModel {
  String? addressId;
  String name;
  String address;
  String houseNo;
  String city;
  String pincode;
  String area;
  String state;
  String landmark;
  String phoneNumber;

  UserAddressModel(
      {this.addressId,
      required this.name,
      required this.address,
      required this.houseNo,
      required this.city,
      required this.pincode,
      required this.area,
      required this.state,
      required this.landmark,
      required this.phoneNumber});

  factory UserAddressModel.fromJson(Map<String, dynamic> json) {
    return UserAddressModel(
        addressId: json["addressId"],
        name: json["name"],
        address: json["address"],
        houseNo: json["houseNo"],
        city: json["city"],
        pincode: json["pincode"],
        area: json["area"],
        state: json["state"],
        landmark: json["landmark"],
        phoneNumber: json["phoneNumber"]);
  }
  Map<String, dynamic> toJson(id) => {
        "addressId": id,
        "name": name,
        "address": address,
        "houseNo": houseNo,
        "city": city,
        "pincode": pincode,
        "area": area,
        "state": state,
        "landmark": landmark,
        "phoneNumber": phoneNumber
      };
}

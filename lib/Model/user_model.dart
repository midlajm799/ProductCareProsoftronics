
class UserModel {
  String? uid;
  String image;
  String userName;
  String email;
 
  UserModel(
      {this.uid,
      required this.image,
      required this.userName,
      required this.email,
    });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json["uid"],
        image: json["image"],
        userName: json["userName"],
        email: json["email"],
       );
  }
  Map<String, dynamic> toJson(uid) => {
        "uid": uid,
        "image": image,
        "userName": userName,
        "email": email,
        
      };
}

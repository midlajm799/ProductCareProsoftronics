class ProductModel {
  String? productId;
  String productName;
  num price;
  String prodcutDescription;
  String productfeature;
  num offer;
  String category;
  String productImage;
  ProductModel(
      {this.productId,
      required this.productImage,
      required this.category,
      required this.offer,
      required this.price,
      required this.prodcutDescription,
      required this.productName,
      required this.productfeature});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        productId: json["productId"],
        productImage: json["productImage"],
        category: json["category"],
        offer: json["offer"],
        price: json["price"],
        prodcutDescription: json["prodcutDescription"],
        productName: json["productName"],
        productfeature: json["productfeature"]);
  }
  Map<String, dynamic> toJson(id) => {
        "productId": id,
        "productImage": productImage,
        "category": category,
        "offer": offer,
        "price": price,
        "prodcutDescription": prodcutDescription,
        "productName": productName,
        "productfeature": productfeature
      };
}

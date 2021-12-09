class Product {
  Product({
    this.productId,
    this.brand,
    this.name,
    this.price,
    this.image,
    this.link,
  });

  int? productId;
  String? brand;
  String? name;
  int? price;
  String? image;
  String? link;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        brand: json["brand"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        link: json["link"],
      );

  Map<String, dynamic> toMap() => {
        "productId": productId,
        "brand": brand,
        "name": name,
        "price": price,
        "image": image,
        "link": link,
      };

  empty() {}
}

class item {
  int? id;
  String? name;
  String? image;
  String? desc;
  num? price;
  int? cal;

  item(
      {required this.id,
      required this.name,
      required this.image,
      required this.desc,
      required this.price,
      required this.cal});

  item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    desc = json['desc'];
    price = json['price'];
    cal = json['cal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['desc'] = desc;
    data['price'] = price;
    data['cal'] = cal;
    return data;
  }
}

class Dishes {
  int id;
  String name;
  String discription;
  int cal;
  int price;

  Dishes(
      {required this.id,
      required this.name,
      required this.discription,
      required this.cal,
      required this.price});
  factory Dishes.fromJson(json) {
    return Dishes(
        id: json['id'],
        name: json['name'],
        discription: json['discription'],
        cal: json['cal'],
        price: json['price']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['discription'] = discription;
    data['cal'] = cal;
    data['price'] = price;
    return data;
  }
}

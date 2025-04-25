class Product{

  int? id;
  String? name;
  String? image;
  int? price;
  String? description;
  // int? interactionCount;

  Product.fromJson(Map<dynamic, dynamic> json){
    id = int.parse(json['id']);
    name = json['name'];
    image = json['image'];
    price = int.parse(json['price']);
    description = json['description'];
    // interactionCount = int.parse(json['interactionCount']);
  }
}

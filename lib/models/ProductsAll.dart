import 'dart:convert';
ProductsAll productsAllFromJson(String str) => ProductsAll.fromJson(json.decode(str));
String productsAllToJson(ProductsAll data) => json.encode(data.toJson());
class ProductsAll {
  ProductsAll({
      this.msg, 
      this.data,});

  ProductsAll.fromJson(dynamic json) {
    msg = json['Msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? msg;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.name, 
      this.description, 
      this.price, 
      this.stock, 
      this.category, 
      this.imageUrl, 
      this.user,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    category = json['category'];
    imageUrl = json['image_url'];
    user = json['user'];
  }
  num? id;
  String? name;
  String? description;
  num? price;
  num? stock;
  String? category;
  dynamic imageUrl;
  num? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['stock'] = stock;
    map['category'] = category;
    map['image_url'] = imageUrl;
    map['user'] = user;
    return map;
  }

}
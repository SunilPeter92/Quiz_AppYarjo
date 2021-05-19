class getCreditModel {
  List<Data> data;

  getCreditModel({this.data});

  getCreditModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int creditId;
  String name;
  int price;

  Data({this.creditId, this.name, this.price});

  Data.fromJson(Map<String, dynamic> json) {
    creditId = json['credit_id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credit_id'] = this.creditId;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
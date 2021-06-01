class getTopQuizModel {
  List<Data> data;

  getTopQuizModel({this.data});

  getTopQuizModel.fromJson(Map<String, dynamic> json) {
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
  int id;
  String name;
  String image;
  String time;
  String prize;
  String catName;

  Data({this.id, this.name, this.image, this.time, this.prize, this.catName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    time = json['time'];
    prize = json['prize'];
    catName = json['cat_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['time'] = this.time;
    data['prize'] = this.prize;
    data['cat_name'] = this.catName;
    return data;
  }
}
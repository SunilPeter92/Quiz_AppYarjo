class GetSolvedQuizModel {
  Data data;

  GetSolvedQuizModel({this.data});

  GetSolvedQuizModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String price;
  String prize;
  String noOfQues;
  String image;
  String catName;
  String percent;
  String time;

  Data(
      {this.id,
        this.name,
        this.price,
        this.prize,
        this.noOfQues,
        this.image,
        this.catName,
        this.percent,
        this.time});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    prize = json['prize'];
    noOfQues = json['no_of_ques'];
    image = json['image'];
    catName = json['cat_name'];
    percent = json['percent'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['prize'] = this.prize;
    data['no_of_ques'] = this.noOfQues;
    data['image'] = this.image;
    data['cat_name'] = this.catName;
    data['percent'] = this.percent;
    data['time'] = this.time;
    return data;
  }
}
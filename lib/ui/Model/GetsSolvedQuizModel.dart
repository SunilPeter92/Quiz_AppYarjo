class GetSolvedQuizModel {
  Status status;

  GetSolvedQuizModel({this.status});

  GetSolvedQuizModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    return data;
  }
}

class Status {
  int id;
  String name;
  String image;
  String price;
  String prize;
  String noOfQues;
  String percent;
  String time;

  Status(
      {this.id,
        this.name,
        this.image,
        this.price,
        this.prize,
        this.noOfQues,
        this.percent,
        this.time});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    prize = json['prize'];
    noOfQues = json['no_of_ques'];
    percent = json['percent'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['prize'] = this.prize;
    data['no_of_ques'] = this.noOfQues;
    data['percent'] = this.percent;
    data['time'] = this.time;
    return data;
  }
}
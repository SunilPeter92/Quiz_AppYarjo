class GetQuizByID {
  List<DataByID> dataByID;

  GetQuizByID({this.dataByID});

  GetQuizByID.fromJson(Map<String, dynamic> json) {
    if (json['Data by ID'] != null) {
      dataByID = new List<DataByID>();
      json['Data by ID'].forEach((v) {
        dataByID.add(new DataByID.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataByID != null) {
      data['Data by ID'] = this.dataByID.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataByID {
  String image;
  String price;
  String prize;
  String name;
  String description;
  String noOfQues;
  String time;
  String actTime;
  String catName;
  String color;

  DataByID(
      {this.image,
        this.price,
        this.prize,
        this.name,
        this.description,
        this.noOfQues,
        this.time,
        this.actTime,
        this.catName,
        this.color});

  DataByID.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    price = json['price'];
    prize = json['prize'];
    name = json['name'];
    description = json['description'];
    noOfQues = json['no_of_ques'];
    time = json['time'];
    actTime = json['act_time'];
    catName = json['cat_name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['price'] = this.price;
    data['prize'] = this.prize;
    data['name'] = this.name;
    data['description'] = this.description;
    data['no_of_ques'] = this.noOfQues;
    data['time'] = this.time;
    data['act_time'] = this.actTime;
    data['cat_name'] = this.catName;
    data['color'] = this.color;
    return data;
  }
}
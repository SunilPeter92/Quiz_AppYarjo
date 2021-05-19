class LeaderBoardModel {
  MyData myData;
  List<MyData> otherData;

  LeaderBoardModel({this.myData, this.otherData});

  LeaderBoardModel.fromJson(Map<String, dynamic> json) {
    myData =
    json['my data'] != null ? new MyData.fromJson(json['my data']) : null;
    if (json['other data'] != null) {
      otherData = new List<MyData>();
      json['other data'].forEach((v) {
        otherData.add(new MyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myData != null) {
      data['my data'] = this.myData.toJson();
    }
    if (this.otherData != null) {
      data['other data'] = this.otherData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyData {
  String name;
  String percent;
  String time;
  String quizId;

  MyData({this.name, this.percent, this.time, this.quizId});

  MyData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    percent = json['percent'];
    time = json['time'];
    quizId = json['quiz_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['percent'] = this.percent;
    data['time'] = this.time;
    data['quiz_id'] = this.quizId;
    return data;
  }
}
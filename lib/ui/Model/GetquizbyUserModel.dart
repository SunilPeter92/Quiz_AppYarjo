class getquizbyuseridModel {
  List<Status> status;

  getquizbyuseridModel({this.status});

  getquizbyuseridModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] != null) {
      status = new List<Status>();
      json['status'].forEach((v) {
        status.add(new Status.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  int id;
  String name;
  String image;

  Status({this.id, this.name, this.image});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
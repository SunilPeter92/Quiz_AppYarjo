class PurchaseHistoryModel {
  List<Status> status;

  PurchaseHistoryModel({this.status});

  PurchaseHistoryModel.fromJson(Map<String, dynamic> json) {
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
  String cardYear;
  String name;
  int price;
  String date;

  Status({this.cardYear, this.name, this.price, this.date});

  Status.fromJson(Map<String, dynamic> json) {
    cardYear = json['card_year'];
    name = json['name'];
    price = json['price'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_year'] = this.cardYear;
    data['name'] = this.name;
    data['price'] = this.price;
    data['date'] = this.date;
    return data;
  }
}
class getUserCredit {
  int credit;

  getUserCredit({this.credit});

  getUserCredit.fromJson(Map<String, dynamic> json) {
    credit = json['credit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credit'] = this.credit;
    return data;
  }
}
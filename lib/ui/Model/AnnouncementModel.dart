class getAnouncement {
   String anouncement;

  getAnouncement({this.anouncement});

  getAnouncement.fromJson(Map<String, dynamic> json) {
    anouncement = json['Anouncement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Anouncement'] = this.anouncement;
    return data;
  }
}
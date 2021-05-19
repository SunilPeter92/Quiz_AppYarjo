class LoginModel {
  String status;
  Data data;

  LoginModel({this.status, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String username;
  String email;
  String password;
  Null country;
  Null marketPreference;
  Null showWidget;
  int status;

  Data(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.password,
        this.country,
        this.marketPreference,
        this.showWidget,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    country = json['country'];
    marketPreference = json['market_preference'];
    showWidget = json['show_widget'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['country'] = this.country;
    data['market_preference'] = this.marketPreference;
    data['show_widget'] = this.showWidget;
    data['status'] = this.status;
    return data;
  }
}
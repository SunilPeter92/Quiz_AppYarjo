class GetUserModel {
  String name;
  String username;
  String email;
  String country;
  String marketPreference;
  String showWidget;

  GetUserModel(
      {this.name,
        this.username,
        this.email,
        this.country,
        this.marketPreference,
        this.showWidget});

  GetUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
    country = json['country'];
    marketPreference = json['market_preference'];
    showWidget = json['show_widget'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['country'] = this.country;
    data['market_preference'] = this.marketPreference;
    data['show_widget'] = this.showWidget;
    return data;
  }
}
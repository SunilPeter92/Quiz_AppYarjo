class ApiConfig {
  String id;
  String url;
  String status;

  ApiConfig(this.id, this.url, this.status);

  ApiConfig.fromJson(Map<String, dynamic> jsonMap){
    id = jsonMap["id"].toString();
    url = jsonMap["url"];
    status = jsonMap["status"].toString();
  }

  Map toMap(){
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["url"] = url;
    map["status"] = status;
  }
}
// class GetQuizbyID {
//   List<Null> data;
//
//   GetQuizbyID({this.data});
//
//   GetQuizbyID.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = new List<Null>();
//       json['data'].forEach((v) {
//         data.add(new Null.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
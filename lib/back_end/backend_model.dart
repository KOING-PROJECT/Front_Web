class BackendModel {
  dynamic data;
  String? message;
  int? status;
  bool? success;

  BackendModel({this.data, this.message, this.status, this.success});

  BackendModel.fromJson(Map<String, dynamic> json) {
    /* if (json['data'] != null) {
      data = <dynamic>[];
      json['data'].forEach((v) {
        data!.add(v);
      });
    }*/
    data=json['data'];
    message = json['message'];
    status = json['status'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    /*if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }*/

    data['data'] = this.data;   // this.data가 Map이 중첩된 형태의 자료구조여도, dynamic type으로 정의해서 재귀적인 JSON형 접근이 가능한거 같음. -성호-
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    return data;
  }
}
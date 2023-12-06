class Hospitaldetail {
  Data? data;
  Header? header;
  String? msg;

  Hospitaldetail({this.data, this.header, this.msg});

  Hospitaldetail.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    header = json['header'] != null ? Header.fromJson(json['header']) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.header != null) {
      data['header'] = this.header!.toJson();
    }
    data['msg'] = this.msg;
    return data;
  }
}

class Data {
  String? address;
  String? description;
  String? hpid;
  int? likeCount;
  String? name;
  String? phone;
  List<String>? time;
  bool? userLiked;

  Data(
      {this.address,
        this.description,
        this.hpid,
        this.likeCount,
        this.name,
        this.phone,
        this.time,
        this.userLiked});

  Data.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    description = json['description'];
    hpid = json['hpid'];
    likeCount = json['likeCount'];
    name = json['name'];
    phone = json['phone'];
    time = json['time'].cast<String>();
    userLiked = json['userLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['description'] = this.description;
    data['hpid'] = this.hpid;
    data['likeCount'] = this.likeCount;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['time'] = this.time;
    data['userLiked'] = this.userLiked;
    return data;
  }
}

class Header {
  int? code;
  String? message;

  Header({this.code, this.message});

  Header.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
class UserModel {
  List<Data>? data;

  UserModel.fromJson(Map<String, dynamic> json) {
    data = [];

    json['data'].forEach((element) {
      data!.add(Data.fromJson(element));
    });
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? avatar;
  String? email;

  Data({this.id, this.firstName, this.lastName, this.avatar, this.email});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    data['email'] = email;
    return data;
  }
}

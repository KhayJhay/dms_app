class UserModel{
  String? uid;
  String? email;
  String? name;

  UserModel({this.uid, this.name, this.email,});

  factory UserModel.fromMap(map)
  {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap(){

    return{
      'uid': uid,
      'email': email,
      'name': name,
    };
  }

}
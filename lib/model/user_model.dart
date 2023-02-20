class UserModel {
  String? uid;
  String? email;
  String? firstname;
  String? lastname;
  String? role;
  String? bio;
  String? study;
  String? dpurl;

  UserModel({this.uid,this.email,this.firstname,this.lastname, this.role, this.bio, this.study, this.dpurl});

  //receive data from server
factory UserModel.fromMap(map){
  return UserModel(
    uid: map['uid'],
    email: map['email'],
    firstname: map['firstname'],
    lastname: map['lastname'],
    role: map['user'],
    bio: map['bio'],
    study: map['study'],
    dpurl: map['dpurl']
  );
}


// send data to server
Map<String, dynamic> toMap(){
  return{
    'uid': uid,
    'email': email,
    'firstname': firstname,
    'lastname': lastname,
    'role': role,
    'bio': bio,
    'study': study,
    'dpurl': dpurl
  };


}

}

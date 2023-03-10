import 'package:astronerds/model/user_model.dart';
class PostModel {
  //Reference? uid;
  //UserModel? user;
  String? uid;
  String? qsnid;
  String? qsndesc;

  //Reference? comments;
  //String? firstname;
  //String? lastname;

  //PostModel({this.uid,this.qsndesc,this.qsnid,this.firstname,this.lastname,  this.comments});

  PostModel({this.uid,this.qsnid,this.qsndesc});

  //receive data from server
  factory PostModel.fromMap(map){
    return PostModel(
        uid: map['uid'],
        qsnid: map['qsnid'],
        qsndesc: map['qsndesc'],

    );
    /*
    return PostModel(
        uid: map['uid'],
        qsndesc: map['qsndesc'],
        qsnid: map['qsnid'],
        comments: map['comments'],
        firstname: map['firstname'],
        lastname: map['lastname'],
    );
     */
  }


// send data to server
  Map<String, dynamic> toMap(){
    return{
      'uid':uid,
      'qsnid': qsnid,
      'qsndesc': qsndesc,
    };

    /*
    return{
      'uid': uid,
      'qsndesc': qsndesc,
      'qsnid': qsnid,
      'comments': comments,
      'firstname': firstname,
      'lastname': lastname,
    };
     */

  }

}

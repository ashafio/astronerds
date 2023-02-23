class BlogModel{
  String? imageUrl;
  String? description;
  String? date;
  String? time;

  BlogModel({this.imageUrl,this.description,this.date,this.time});


  //receive data from server
  factory BlogModel.fromMap(map){
    return BlogModel(
        imageUrl: map['imageUrl'],
        description: map['description'],
        date: map['date'],
        time: map['time']

    );
  }



// send data to server
  Map<String, dynamic> toMap(){
    return{
      'imageUrl' : imageUrl,
      'description' : description,
      'date': date,
      'time' : time
    };


  }

}







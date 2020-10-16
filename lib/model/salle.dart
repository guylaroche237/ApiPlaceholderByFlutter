class Salle{
  String id;
  String title;
  String images;

  Salle({this.id,this.title,this.images});

  Salle.fromJson(Map<String,dynamic> json){
    id = json['id'];
    title = json['title'];
    images = json['images'];
  }
}
class Photo{
  int albumId;
  int id;
  String title;
  String url;

  Photo({
    this.albumId,this.id,this.title,this.url
});
  Photo.fromJson(Map<String,dynamic> json){
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
  }

  static List<Photo> ListFromJson(List<dynamic> json){
    return List<Photo>.from(json.map((e) => Photo.fromJson(e)));
  }
}
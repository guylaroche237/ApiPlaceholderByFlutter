class Cinema{
  int id;
  String name;
  String year;
  int duree;

  Cinema({this.id,this.name,this.year,this.duree});
  Cinema.fromJson(Map<String,dynamic> json){
    id = json['id'];
  }

}
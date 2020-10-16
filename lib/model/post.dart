class Posts{
  int id;
  int userId;
  String title;
  String body;

  Posts(int userId, String title, String body) {
    this.userId = userId;
    this.title = title;
    this.body = body;
  }

  Posts.fromJson(Map<String ,dynamic> json){
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
  }

  static List<Posts> ListFromJson(List<dynamic> json){
    return List<Posts>.from(json.map((e) => Posts.fromJson(e)));
  }

}
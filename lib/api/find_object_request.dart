import 'dart:convert';

import 'package:cinemaservice/model/photo.dart';
import 'package:cinemaservice/model/post.dart';
import 'package:http/http.dart';

class FindObjectRequest{

  static bool isAsyncrone = true;


  Future<List<Posts>> getAllPost() async {
    Response response = await get(Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"), headers: {"Accept" : "application/json"});
    if(response.statusCode == 200){
      List<Posts> posts = Posts.ListFromJson(jsonDecode(response.body));
      isAsyncrone = false;
      return posts;
    }else{
      isAsyncrone = false;
      return [];
    }
  }

  Future<List<Photo>> getAllPhoto() async {
    Response response = await get(Uri.encodeFull("https://jsonplaceholder.typicode.com/photos"), headers: {"Accept" : "application/json"});
    if(response.statusCode == 200){
      List<Photo> photos = Photo.ListFromJson(jsonDecode(response.body));
      isAsyncrone = false;
      return photos;
    }else{
      isAsyncrone = false;
      return [];
    }
  }

  Future<Photo> getPhotoById(int id) async {
    Response response = await get(Uri.encodeFull("https://jsonplaceholder.typicode.com/photos/"+id.toString()), headers: {"Accept" : "application/json"});
    if(response.statusCode == 200){
      Photo photo = Photo.fromJson(jsonDecode(response.body));
      isAsyncrone = false;
      return photo;
    }else{
      isAsyncrone = false;
      return null;
    }
  }

}
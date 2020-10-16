import 'package:cinemaservice/api/find_object_request.dart';
import 'package:cinemaservice/model/photo.dart';
import 'package:cinemaservice/model/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget{
  final Posts posts;
  const PostDetailScreen({Key key, this.posts}) : super(key: key);
  _postDetailScreenState createState() => _postDetailScreenState();
}

class _postDetailScreenState extends State<PostDetailScreen>{
  bool active = false;
  FindObjectRequest findObjectRequest = FindObjectRequest();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Post"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: (active)?FutureBuilder(
                future: findObjectRequest.getPhotoById(widget.posts.id),
                builder: (BuildContext context,AsyncSnapshot<Photo> snapshot){
                  if(snapshot.hasData){
                   return  Container(
                     padding: EdgeInsets.all(5),
                     width: 100,
                     height: 100,
                     child: Image.network(snapshot.data.url,),
                   );


                  }
                  return Center(child: CircularProgressIndicator(),);
                },
              ):SizedBox(),
            ),
            Divider(height: 8,color: Colors.red,),
            Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text("TITRE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    subtitle: Text(widget.posts.title,style: TextStyle(color: Colors.blueAccent,fontSize: 10),),
                    leading: Icon(Icons.title),
                  ),
                  Divider(height: 2,),
                  ListTile(
                    title: Text("ID",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    subtitle: Text(widget.posts.id.toString(),style: TextStyle(color: Colors.blueAccent,fontSize: 10),),
                    leading: Icon(Icons.attach_money),
                  ),
                  Divider(height: 2,),
                  ListTile(
                    title: Text("BODY",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    subtitle: Text(widget.posts.body,style: TextStyle(color: Colors.blueAccent,fontSize: 10),maxLines: 5,),
                    leading: Icon(Icons.message),
                  ),
                  Divider(height: 2,),
                  ListTile(
                    title: Text("ID USER",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    subtitle: Text(widget.posts.userId.toString(),style: TextStyle(color: Colors.blueAccent,fontSize: 10),),
                    leading: Icon(Icons.person),
                  ),
                  Divider(height: 2,),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.6,
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text((!active)?"chargement Image":"cacher l'image",style: TextStyle(color: Colors.white),),
                  Icon(Icons.sync)
                ],
              ),onPressed: (){
                  setState(() {
                    active = !active;
                  });
              },),
            )

          ],
        ),
      ),
    );


  }

}
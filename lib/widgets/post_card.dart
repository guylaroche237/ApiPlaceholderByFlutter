import 'package:cinemaservice/model/post.dart';
import 'package:cinemaservice/widgets/post_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget{
  final Posts posts;

  const PostCard({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(

     padding: EdgeInsets.all(2),
     child: Card(
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           //Image.asset("assets/appimages/image"),
           Container(
               width: MediaQuery.of(context).size.width*0.8,
               height: MediaQuery.of(context).size.height*0.15,
             padding: EdgeInsets.all(2),
             child: ListTile(
               title: Text(this.posts.title,style: TextStyle(fontWeight: FontWeight.bold),maxLines: 1,),
               subtitle: Text(this.posts.body,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),maxLines: 2,),
               leading: Icon(Icons.contact_mail),
               trailing: Text(this.posts.id.toString()),
               onTap: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => PostDetailScreen(posts: this.posts,)),
                 );
               },
             )
           )

         ],
       ),
     ),
   );
  }

}
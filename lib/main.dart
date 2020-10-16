import 'package:cinemaservice/api/find_object_request.dart';
import 'package:cinemaservice/model/post.dart';
import 'package:cinemaservice/widgets/post_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Posts> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllpost();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.9,
          child: (list == null)?Center(child: CircularProgressIndicator()):ListView.builder(
              itemCount: (list == null)?0:list.length,
              itemBuilder: (context,index){
                Posts post = list[index];
                return PostCard(posts: post,);
              }),

        ),

      ),

    );
  }

  getAllpost() async {
    FindObjectRequest findObjectRequest = FindObjectRequest();
    List<Posts> posts = await findObjectRequest.getAllPost();
    setState(() {
      list = posts;
    });
  }
}

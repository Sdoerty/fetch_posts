import 'package:fetch_posts/post_model.dart';
import 'package:flutter/material.dart';
import 'package:fetch_posts/api.dart';

class PagePosts extends StatefulWidget {
  const PagePosts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<PagePosts> {

  late Future<List<Post>> fpost;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fpost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List<Post>>(
            future: fpost,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 400,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("User ID: ${snapshot.data![index].userId}"),
                              Text("Post ID: ${snapshot.data![index].id}"),
                              Text("Post Title: ${snapshot.data![index].title}"),
                              Text("Text: ${snapshot.data![index].body}"),
                            ],
                          ),
                        );
                      }),
                );
          } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            })
      ],
    );
  }
}


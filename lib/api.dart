import 'dart:convert';
import 'package:fetch_posts/post_model.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPost() async{
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final response = await http.get(url);

  if(response.statusCode == 200) {
    List parsedJson = jsonDecode(response.body);
    List list = parsedJson.map((e) => Post.fromJson(e)).toList();
    return list as List<Post>;
  }else{
    throw Exception('SHIT!!!');
  }
  }
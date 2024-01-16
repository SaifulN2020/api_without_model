import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ApiWithoutMomdel(

      ),
    );
  }
}
class ApiWithoutMomdel extends StatefulWidget {
  const ApiWithoutMomdel({Key? key}) : super(key: key);

  @override
  State<ApiWithoutMomdel> createState() => _ApiWithoutMomdelState();
}

class _ApiWithoutMomdelState extends State<ApiWithoutMomdel> {
  List<Photos> photoList=[];
  Future<List<Photos>> getPhotos() async{
    final  response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==00){
      for(Map i in data){
        Photos photos=Photos(title: i["title"], id: i["id"]);
        photoList.add(photos);

      }return photoList;
    }else{
      return photoList;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API  without model"),),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotos(),
              builder: (context,snapshot){
                return ListView.builder(
                  itemCount: photoList.length,
                    itemBuilder:(contex,index){
                      return ListTile(
                        title: Text("Hello"),
                      );
                    } );
            },
            ),
          )
        ],
      ),
    );
  }
}

class Photos{
  String title;
  int id;
  Photos({required this.title, required this.id});
}
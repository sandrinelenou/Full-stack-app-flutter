import 'package:flutter/material.dart';
import 'package:flutter_api/models/movie.dart';
import 'package:flutter_api/pages/drawer.dart';
import 'package:flutter_api/pages/movie_detail.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'form/form_screen.dart';

//https://omdbapi.com/?s=Batman&page=2&apikey=564727fa
//https://api.themoviedb.org/3/movie/now_playing?api_key=1500496dcaf1512b62894bd98ba83f9d
class MyHomePage extends StatelessWidget {

  late final List<Movie> movies;

  //Future<List<Movie>> fetchAllMovies() async {
  Future fetchAllMovies() async{
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=1500496dcaf1512b62894bd98ba83f9d")); // response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));

    if (response.statusCode == 200) {
      /*final result = json.decode(response.body);
      Iterable list = result["results"];
      return list.map((movie) => Movie.fromJson(movie)).toList();*/
     List<dynamic> result = json.decode(response.body)["results"]; // //var jsonString = response.body;   //var jsonMap = jsonDecode(jsonString); var result = json.decode(response.body)["results"];

      return result
          .map((movie) => Movie.fromJson(movie))
          .toList(); // return Movie.fromJson(result);   // return listResponse = json.decode(res.body);   //body["results"]

    } else {
      throw Exception('Failed to load movie');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        // backgroundColor: Color(0xFFEFEFEF),
        title: Text("Movies API",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        actions:<Widget> [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FormScreen(id: '', password: '', name: '', email: '',)));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
          )
        ],

      ),
      drawer: NavDrawerDemo(),
      body: FutureBuilder(
        future: fetchAllMovies(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                //padding: EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetail(movie: snapshot.data[index]),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 250,
                          // alignment: Alignment.centerLeft,
                          child: Card(
                            child: Image.network(
                                "https://image.tmdb.org/t/p/w500" +
                                    snapshot.data[index].poster_path),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  snapshot.data[index].original_title,
                                  style: TextStyle(color: Colors.red),
                                ),
                                Text(snapshot.data[index].release_date),
                                Text(snapshot.data[index].overview),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }
          //by default show a loading spinner
          return Center(child: CircularProgressIndicator());
          //return CircularProgressIndicator();
        },
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutterapp/models/movie_model1.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


class RepoTMDB {

  List<Movie> _movies = List<Movie>();

  static Future<List<Movie>> getPopularMovies() async{
    String url = "https://api.themoviedb.org/3/movie/popular?api_key=62feaff3d2cf094a340f530fbf25bde9";

    final data = await http.get(url);

    var jsonData = json.decode(data.body)["results"];

    List<Movie> movies = [];

    for(var u in jsonData){
      Movie movie = Movie(u["id"], u["title"], u["poster_path"], u["overview"], u["release_date"]);
      movies.add(movie);
    }

    print("len : "+movies.length.toString());

    return movies;

  }

  static Future<List<Movie>> getPopularTVShows() async{
    String url = "https://api.themoviedb.org/3/tv/popular?api_key=62feaff3d2cf094a340f530fbf25bde9";

    final data = await http.get(url);

    var jsonData = json.decode(data.body)["results"];

    List<Movie> movies = [];

    for(var u in jsonData){
      Movie movie = Movie(u["id"], u["name"], u["poster_path"], u["overview"], u["first_air_date"]);
      movies.add(movie);
    }

    print("len 2 : "+movies.length.toString());

    return movies;

  }

  static Future<List<Movie>> getBestMovies() async{
    String url = "https://api.themoviedb.org/3/movie/top_rated?api_key=62feaff3d2cf094a340f530fbf25bde9";

    final data = await http.get(url);

    var jsonData = json.decode(data.body)["results"];

    List<Movie> movies = [];

    for(var u in jsonData){
      Movie movie = Movie(u["id"], u["title"], u["poster_path"], u["overview"], u["release_date"]);
      movies.add(movie);
    }

    print("len 2 : "+movies.length.toString());

    return movies;

  }
}

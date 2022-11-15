import 'dart:convert';
import "package:http/http.dart" show Client, Response;
import 'package:acara35/model/popular_movies.dart';
import 'package:http/http.dart';

class ApiProvider {
  String apiKey = 'fb19b803a846ff523151f0222c4e8e00';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Uri url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
    Response response = await client.get(url);

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}

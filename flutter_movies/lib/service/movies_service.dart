import 'dart:convert';

import 'package:flutter_movies/bean/film_list_bean.dart';

import 'package:http/http.dart' as http;

class MoviesService {
  String movies_url =
      "http://api.douban.com/v2/movie/in_theaters?apikey=0df993c66c0c636e29ecbb5344252a4a&start=0&count=10";

  Future<FilmListBean> getMovies() async {
    var response = await http.get(movies_url);
    return FilmListBean.fromJson(jsonDecode(response.body));
  }
}

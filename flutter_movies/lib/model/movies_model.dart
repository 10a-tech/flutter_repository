import 'package:flutter_movies/model/base_model.dart';
import 'package:flutter_movies/bean/film_list_bean.dart';
import 'package:flutter_movies/bean/user_bean.dart';
import 'package:flutter_movies/service/movies_service.dart';

class MoviesModel extends BaseModel{

  MoviesService _service;
  FilmListBean _filmListBean;

  FilmListBean get filmListBean => _filmListBean;

  MoviesModel(MoviesService service){
    this._service = service;
  }

  Future<UserBean> getMovies() async{
    showLoading();
    _filmListBean =  await _service.getMovies();
    closeLoading();
  }
}
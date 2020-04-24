import 'package:flutter/material.dart';
import 'package:flutter_movies/bean/film_list_bean.dart';
import 'package:flutter_movies/model/movies_model.dart';
import 'package:flutter_movies/service/movies_service.dart';
import 'package:flutter_movies/widget/provider_widget.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('电影列表'),
        ),
        body: Container(
          child: Center(
            child: ProviderWidget<MoviesModel>(
                model: MoviesModel(Provider.of<MoviesService>(context)),
                onReady: (model) => model.getMovies(),
                builder: (context, model, child) {
                  if (model.loading) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      itemCount: model.filmListBean.subjects.length,
                      itemBuilder: (context, index) {
                        Subjects subject = model.filmListBean.subjects[index];
                        return ListTile(
                          leading: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(subject.images.small),
                                    fit: BoxFit.fill)),
                          ),
                          title: Text(subject.title),
                          trailing: Icon(Icons.sort),
                        );
                      },
                    );
                  }
                }),
          ),
        ));
  }
}

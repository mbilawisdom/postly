import 'dart:convert';

import 'package:Postly/model/currentUser.dart';
import 'package:Postly/model/posts.dart';
import 'package:Postly/service/serviceApi.dart';
import 'package:Postly/state/appState.dart';
import 'package:flutter/cupertino.dart';

class PostState extends AppState {

  List<Post> _listPosts = [];

   List<Post> get listPosts => _listPosts;

  PostState(){
    getposts();
  }


   Future<List<Post>> getposts() async {

    loadingState = loadState.Loading;

    await Future.delayed(Duration(seconds: 2));
    ServiceApi.getRequest("/posts").then((value) => {

      if(value is Exception || value == null){
       loadingState = loadState.Error,
        notifyListeners()
      } else {
        _listPosts = (json.decode(value) as List).map((e)
        => Post.fromJson(e)).toList(),
        loadingState = loadState.Success,
        notifyListeners()
      }


    });

  }

  Future<Post> createPosts({@required int userID, @required String title,
    @required String body}) async {

    loadingState = loadState.Loading;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    var mapBody = Post(
      title: title,
      body: body,
      userId: currentUser.id
    ).toJson();

    print(currentUser.id);


    ServiceApi.postRequest(endpoint: "/posts", body: {
      "userId": 1.toString(),
      "title": "s]gmae",
      "body": "quia et suscipit\nsuscasdfdf"
    }.toString()).then((value) => {

      if(value is Exception || value == null){
        loadingState = loadState.Error,
        notifyListeners()
      } else {

        loadingState = loadState.Success,
        notifyListeners()
      },

      print(value)

    });



  }

}
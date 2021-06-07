import 'dart:convert';
import 'dart:math';
import 'package:Postly/model/currentUser.dart';
import 'package:Postly/model/user.dart';
import 'package:Postly/service/serviceApi.dart';
import 'package:Postly/state/postState.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum loadState {Loading, Success, Error}
enum level {Beginner,Intermediate,Professional}


class AppState with ChangeNotifier{

AppState(){
  getConfig();
}
  var loadingState;
User _currentUser;
User get currentUser => _currentUser;




  Future<User> getUser() async {
    final _random = new Random();
    List<User> usersList = [];

    loadingState = loadState.Loading;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    ServiceApi.getRequest("/users").then((value) => {

      if(value != null){
        usersList =
            (json.decode(value) as List).map((json) => User.fromJson(json))
                .toList(),
        _currentUser = usersList[_random.nextInt(usersList.length)],
        print("NEW USER - " + currentUser.username),
        saveUserObject(currentUser, 0),
    notifyListeners()


      }

    });
  return currentUser;
  }

  Future<void> saveUserObject(User user, int points) async {
    final userObject =   Map<String, dynamic>();
    userObject["id"] = user.id;
    userObject["username"] = user.username;
    userObject["name"] = user.name;
    userObject["points"] = points;
    userObject["level"] = badgeMetric(points);

    var _pref =  await SharedPreferences.getInstance();
        _pref.setString("encodedUser", json.encode(userObject));

  }

  String badgeMetric(int points){
    if(points < 6){
      return "Beginner";
    }
    if(points < 10)
      {
        return "Intermediate";
      }
    if(points <= 16 ){
      return "Professional";
    }
    notifyListeners();
  }

  Future<void> getConfig() async{

    SharedPreferences pref = await SharedPreferences.getInstance();
    final encodedUser = pref.getString("encodedUser");

    if(encodedUser != null){
      Map<String,dynamic> userObject = json.decode(encodedUser);

      print("SAVED USER : - " + "${userObject["username"]}");

    _currentUser =  CurrentUser.fromsaved(
        id: userObject["id"],
        username: userObject["username"],
        name: userObject["name"],
        point: userObject["points"],
        level: userObject["level"]
      );
    notifyListeners();

    }else{
      getUser();
    }

notifyListeners();
  }


}
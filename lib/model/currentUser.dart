import 'package:Postly/model/user.dart';

class CurrentUser extends User {
  final int id;
  final String username;
  final String name;
  final int point;
  final String level;

  CurrentUser.fromsaved({this.id, this.username, this.name, this.point, this.level}) : super(
    id: id,
    name: name,
    username: username,);




}
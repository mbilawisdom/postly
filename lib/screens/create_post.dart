import 'package:Postly/state/appState.dart';
import 'package:Postly/state/postState.dart';
import 'package:Postly/utils/animation_wrapper/transition_wrapper.dart';
import 'package:Postly/widgets/button.dart';
import 'package:Postly/widgets/custom_textfield.dart';
import 'package:Postly/widgets/custom_widgets.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CreatePost extends StatefulWidget {

  const CreatePost({Key key}) : super(key: key);

  @override
  _CreatePostState createState() {
    return _CreatePostState();
  }
}

class _CreatePostState
    extends State<CreatePost> {
 
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomWidget.customAppBar("Create Posts", titleColor: Colors.black87,
          fontWeight: FontWeight.w400),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child:
        Form(
          key: _formKey,
          child: Column(
            children:
          <Widget>[
            CustomInputField(hint: "Post Title", keyboardType: TextInputType.name,
                    controller: _titleController),

            const SizedBox(height: 16.0),

            Container(

              child:  Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  child:
                  TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _bodyController,
                      minLines: 6,
                      maxLines: 10,
                      cursorColor: Colors.black12,
                      decoration: InputDecoration(
                          border:  new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(8.0)
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                          hintText: "Type is your post",
                          fillColor: Colors.black12 ,
                          filled: true))),
            ),


                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Button("Post", color: Color(0xff61319F),
                        textColor: Colors.white, onpressed: (){
                          print("done");
                        submitPostForm();
                        },),
                    )




          ],
      ),
        )),

    );
  }


  void submitPostForm(){



    String title =  _titleController.text;
    String body = _bodyController.text;
    int id = Provider.of<AppState>(context, listen: false).currentUser.id;
    var state = Provider.of<PostState>(context, listen: false);
    if(_formKey.currentState.validate()){

      state.createPosts(userID: id, title: title, body: body);

    }

  }


}

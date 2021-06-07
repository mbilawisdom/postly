import 'package:Postly/model/posts.dart';
import 'package:Postly/screens/create_post.dart';
import 'package:Postly/state/appState.dart';
import 'package:Postly/state/postState.dart';
import 'package:Postly/utils/animation_wrapper/transition_wrapper.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _StateHomeScreen();
}

class _StateHomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        titleSpacing: 5,
        elevation: 0,
        bottom: PreferredSize(child: Divider(endIndent: 0,), preferredSize: Size(0,0), ),
        title: Text("@mbilawisdom", style: GoogleFonts.ubuntu(
            color: Colors.black54,
          fontSize: 18
        ),),
      ),

      body: body()
    );
  }


  Widget createPost(){

    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return const CreatePost();
            },
          ),
        );
      },
      child: Container(
        height: 50,
        child:  Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10, vertical: 5),
            child:
            TextField(
                cursorColor: Colors.black12,
                enabled: false,
                decoration: InputDecoration(
                    border:  new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0)
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                    hintText: "Write post",
                    hintStyle: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),

                    suffixIcon: Icon(FontAwesomeIcons.edit, size: 20,),
                    focusColor: Colors.black,
                    fillColor: Colors.black12 ,
                    filled: true))),
      ),
    );

  }

  Widget singlePost(Post post){
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xff61319F).withAlpha(10),
        borderRadius: BorderRadius.circular(10)

      ),
      child: ListTile(

        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(post.title ?? " ", style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),),
        ),
        contentPadding: EdgeInsets.all(5),
        subtitle: Text(post.body ?? " ",

          style: GoogleFonts.ubuntu(
          fontSize: 16,
        ),),
      ),
    );
  }


  Widget body(){
    var posts = Provider.of<PostState>(context);
    return   SafeArea(child: Container(
      child:
      Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xff61319F).withAlpha(50),
                      offset: Offset(0.5,0.5),
                      blurRadius: 0.5
                  )
                ],
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Wisdom Mbila", style:
                    GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                    ),),
                    SizedBox(width: 5),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Color(0xff61319F),
                      child: Text("10", style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: Colors.white
                      ),),
                    )
                  ],
                ),
                Text("Beginner", style:
                GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w500,
                    fontSize: 15
                ),),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xff61319F),
                      child: Text("WM", style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: Colors.white
                      ),),
                    ),
                    Expanded(child: createPost()),
                  ],
                ),
              ],
            ),
          ),


          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Posts", style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black54
                        ),),


                      ],
                    ),

                    if(posts.loadingState == loadState.Loading)

                    Center(child: CircularProgressIndicator())
                    else if(posts.loadingState == loadState.Success)
                    Column(
                      children: posts.listPosts.map((model) => singlePost(model)).toList()
                    )
                    else if(posts.loadingState == loadState.Error)
                      Container()

                  ],
                ),
              ),
            ),
          )

        ],
      ),
    ));

  }

}















































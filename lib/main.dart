import 'package:Postly/screens/home_screen.dart';
import 'package:Postly/state/appState.dart';
import 'package:Postly/state/postState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Postly());
}

class Postly extends StatelessWidget {
  // This widget is the root of your application.

  AppState _app = AppState();
  PostState _postState = PostState();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
        create: (context) => _app,
    child: Consumer<AppState>(
    builder: (context, value, child){

    return MultiProvider(
    providers: [
    ChangeNotifierProvider<PostState>(
    create: (_) => _postState)

    ],
    child:MaterialApp(
      title: 'Postly',
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: HomeScreen(),
    ));
  }
    ));
}

}

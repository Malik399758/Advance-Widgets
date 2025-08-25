import 'package:advance_widgets/views/screens/dismissible_widget/dismissible_screen.dart';
import 'package:advance_widgets/views/screens/expansion_tile_widget/expansion_tile_list_screen.dart';
import 'package:advance_widgets/views/screens/expansion_tile_widget/expansion_tile_screen.dart';
import 'package:advance_widgets/views/screens/favorite/favorite_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FavoriteHomeScreen()
      //ExpansionTileListScreen()
      //ExpansionTileScreen()
      //DismissibleScreen()
    );
  }
}

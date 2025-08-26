import 'package:advance_widgets/controllers/count_provider.dart';
import 'package:advance_widgets/views/screens/cart/cart_home_screen.dart';
import 'package:advance_widgets/views/screens/dismissible_widget/dismissible_screen.dart';
import 'package:advance_widgets/views/screens/expansion_tile_widget/expansion_tile_list_screen.dart';
import 'package:advance_widgets/views/screens/expansion_tile_widget/expansion_tile_screen.dart';
import 'package:advance_widgets/views/screens/fast_food_screen/fast_food_list_screen.dart';
import 'package:advance_widgets/views/screens/favorite/favorite_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white
          ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.white)
          ),
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,brightness: Brightness.dark),
          useMaterial3: true,
        ),
        home: FastFoodListScreen()
        //CartHomeScreen()
        //FavoriteHomeScreen()
        //ExpansionTileListScreen()
        //ExpansionTileScreen()
        //DismissibleScreen()
      ),
    );
  }
}

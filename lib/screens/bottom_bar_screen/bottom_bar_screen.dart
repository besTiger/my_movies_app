import 'package:flutter/material.dart';
import 'package:my_movies_app/screens/bottom_bar_screen/widgets/bottom_bar_widget.dart';
import '../favorite_screen/favorite_screen.dart';
import '../movies_screen/movies_screen.dart';
import '../search_screen/search_screen.dart';


class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  BottomBarScreenState createState() => BottomBarScreenState();
}

class BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0; //default index

  final List<Widget> widgetOptions = [
    const MoviesScreen(),
    const SearchScreen(),
    const FavoriteScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

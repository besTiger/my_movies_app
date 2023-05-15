import 'package:flutter/material.dart';
import 'package:my_movies_app/screens/movies_screen/tabs_movies_screen/popular_tab.dart';
import 'package:my_movies_app/screens/movies_screen/tabs_movies_screen/top_rated_tab.dart';
import 'package:my_movies_app/screens/movies_screen/tabs_movies_screen/upcoming_tab.dart';
import 'package:provider/provider.dart';
import '../../theme/theme_model.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return SafeArea(
          child: DefaultTabController(
        length: 3,
            child: Scaffold(
             appBar: AppBar(
              title: const Text(
               'Movies',
               style: TextStyle(
                fontSize: 26.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
               ),
             ),
              centerTitle: true,
              backgroundColor: Colors.orange,
              actions: [
              IconButton(
                  onPressed: () {
                    themeNotifier.isDark
                        ? themeNotifier.isDark = false
                        : themeNotifier.isDark = true;
                  },
                  icon: Icon(
                    themeNotifier.isDark
                        ? Icons.nightlight_round
                        : Icons.wb_sunny,
                    color: Colors.black,
                  ))
             ],
             ),
             body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
               children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: 'Popular',
                      ),
                      Tab(
                        text: 'Upcoming',
                      ),
                      Tab(
                        text: 'Top Rated',
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      PopularTab(),
                      UpcomingTab(),
                      TopRatedTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    });
  }
}

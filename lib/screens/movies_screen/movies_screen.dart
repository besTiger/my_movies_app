import 'package:flutter/material.dart';
import 'package:my_movies_app/screens/movies_screen/tabs_movies_screen/popular_tab.dart';
import 'package:my_movies_app/screens/movies_screen/tabs_movies_screen/top_rated_tab.dart';
import 'package:my_movies_app/screens/movies_screen/tabs_movies_screen/upcoming_tab.dart';
import 'package:my_movies_app/screens/movies_screen/widgets/%D1%81ustom_app_bar_widget.dart';
import 'package:my_movies_app/screens/movies_screen/widgets/tab_bar_container_widget.dart';
import 'package:provider/provider.dart';
import '../../theme/theme_model.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: CustomAppBar(themeNotifier: themeNotifier),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  TabBarContainer(),
                  Expanded(
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
        ),
      );
    });
  }
}
